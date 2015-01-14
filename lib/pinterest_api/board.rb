module PinterestApi
  class Board
    attr_accessor :name, :description, :pins, :followers, :fullname, :pins_list, :json

    def initialize user, board
      response = RestClient.get "https://www.pinterest.com/#{user}/#{board}", :user_agent => 'Chrome'
      @html = Nokogiri::HTML(response)
      board_info
    end

    def board_info
      @json = JSON.parse(@html.css("#jsInit").text.match(/P\.start\.start\((.+)\)/)[0].gsub!("P.start.start(","").gsub!(/\)\z/,""))
      @name = @html.css(".mainContainer .smallBoardName")[0].text
      @description = @html.css(".mainContainer .description")[0].text.strip
      @pins = @html.css(".mainContainer .pinsAndFollowerCount .value")[0].text.strip.to_i
      @followers = @html.css(".mainContainer .pinsAndFollowerCount .value")[1].text.strip.to_i
      @fullname = @html.css(".mainContainer .fullname")[0].text
      @pins_list = parse_pins(@json['resourceDataCache'][5]['data'])
    end

    def parse_pins pins
      pins = pins[1..pins.length]
      pin_list = []
      pins.each do |pin|
        pin_list.push(PinterestApi::Pin.new(pin))
      end
      pin_list
    end

  end
end
