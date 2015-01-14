class BoardsController < ApplicationController

  def show
    if ENV['PINTEREST_API_KEY'] == "iO1L4GNdvR5670cfY2485g2e99QFhjMY"
      @data = PinterestApi::Board.new(params[:username],params[:board])
    else
      @data = {
        :error => "Permission Denied."
      }
    end
  end

end
