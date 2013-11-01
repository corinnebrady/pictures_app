class PagesController < ApplicationController
  def home
    @pictures = Picture.all
  end
end