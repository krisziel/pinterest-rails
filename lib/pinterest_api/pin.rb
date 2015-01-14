module PinterestApi
  class Pin
    attr_accessor :domain, :is_repin, :price, :title, :author, :link, :images, :description, :color, :pin_join, :id

    def initialize pin
      parse_pin pin
    end

    def parse_pin json
      @title = json['title']
      @id = json['id']
      @description = json['description']
      @title = json['title']
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
