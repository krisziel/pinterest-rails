module PinterestApi
  class Pin
    attr_accessor :domain, :is_repin, :price, :title, :author, :link, :images, :description, :color, :pin_join, :id

    def initialize pin
      parse_pin pin
    end

    def parse_pin json
      @title = json['title'].strip
      @id = json['id'].strip
      @description = json['description'].strip
      @title = json['title'].strip
      @is_repin = json['is_repin']
      @domain = json['domain']
      @price = {
        :currency => json['price_currency'],
        :value => json['price_value']
      }
      @images = json['images']
      @color = json['dominant_color']
      @pin_join = json['pin_join']
    end

  end
end
