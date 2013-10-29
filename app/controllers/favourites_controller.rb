class FavouritesController < ApplicationController

  def new

  end

  def create
  end

  def index
    @favourites = Favourite.all
  end


end