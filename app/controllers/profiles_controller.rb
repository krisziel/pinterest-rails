class ProfilesController < ApplicationController

  def index
    # @data = PinterestApi::Profile.new('designror')
  end

  def show
    if ENV['PINTEREST_API_KEY'] == "iO1L4GNdvR5670cfY2485g2e99QFhjMY" || params[:key] == "iO1L4GNdvR5670cfY2485g2e99QFhjMY"
      @data = PinterestApi::Profile.new(params[:username])
    else
      @data = {
        :error => "Permission Denied."
      }
    end
  end

  def board
    if ENV['PINTEREST_API_KEY'] == "iO1L4GNdvR5670cfY2485g2e99QFhjMY" || params[:key] == "iO1L4GNdvR5670cfY2485g2e99QFhjMY"
      @data = PinterestApi::Board.new(params[:username],params[:board])
    else
      @data = {
        :error => "Permission Denied."
      }
    end
  end

end
