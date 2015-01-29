class ProfilesController < ApplicationController

  protect_from_forgery except: [:profile,:board]

  def profile
    headers['Access-Control-Allow-Origin'] = '*' if !params[:callback]
    @data = PinterestApi::Profile.new(params[:username])
    render :json => @data, :callback => params[:callback]
  end

  def board
    headers['Access-Control-Allow-Origin'] = '*' if !params[:callback]
    @data = PinterestApi::Board.new(params[:username],params[:board])
    render :json => @data, :callback => params[:callback]
  end

end
