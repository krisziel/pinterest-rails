module PinterestApi
  class Profile
    attr_accessor :username, :name, :boards, :pins, :followers, :following, :board_list, :html

    def initialize username
      @username = username
      if File.exists?("lib/#{username}.html")
        f = File.open("lib/#{username}.html")
        @html = Nokogiri::HTML(f)
        f.close
      else
        response = RestClient.get "https://www.pinterest.com/#{username}/", :user_agent => 'Chrome'
        @html = Nokogiri::HTML(response)
      end
      user_data
    end

    def user_data
      @name = @html.css('.profileInfo .name')[0].text.strip
      @boards = user_stat("boards")
      @pins = user_stat("pins")
      @followers = user_stat("followers")
      @following = user_stat("following")
      @board_list = []
      @html.css(".UserBoards .item .boardCoverImage").each do |board|
        @board_list.push(parse_board(board))
      end
    end

    private

    def parse_board board
      images = {
        :main => board.css(".boardCover")[0].attr("src"),
        :thumbs => board_images(board.css(".boardThumbs")[0])
      }
      data = {
        :title => board.css(".boardRepTitle .title")[0].text.strip,
        :fullname => board.css(".boardRepTitle .fullname")[0].text.strip,
        :link => board.css(".boardLinkWrapper")[0].attr("href"),
        :description => board.css(".boardLinkWrapper")[0].attr("title"),
        :images => images,
        :pins => board.css(".PinCount")[0].children[2].text.strip.to_i
      }
    end

    def board_images(images)
      thumbs = []
      images.css("img").each do |thumb|
        thumbs.push(thumb.attr("src"))
      end
      thumbs
    end

    def user_stat stat
      @html.css("meta[name=\"pinterestapp:#{stat}\"]")[0].attr("content").to_i
    end

    def parseInt value
      value.gsub(/,/,"").strip.to_i
    end

  end
end
