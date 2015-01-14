class ProfilesController < ApplicationController

  def index
    # @data = PinterestApi::Profile.new('designror')
  end

  def show
    @data = PinterestApi::Profile.new(params[:username])
  end

  def board
    @data = PinterestApi::Board.new(params[:username],params[:board])
  end

end
