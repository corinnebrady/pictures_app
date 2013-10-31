class SearchController < ApplicationController

  def search
    @pictures = Picture.where("name ilike ?", "%#{params[:query]}%")
    @users = User.where("username ilike ?", "%#{params[:query]}%")
  end

end