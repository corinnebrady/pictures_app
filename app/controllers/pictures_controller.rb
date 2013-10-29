class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new params[:picture]
    @picture.user = @authenticated
    if @picture.save
      redirect_to picture_path(@picture)
    else
      render 'new'
    end
  end


  def edit
    @picture = Picture.find params[:id]
    if @picture.user_id != @authenticated.id
      redirect_to picture_path(@picture)
    else
      render :new
    end
  end

  def update
    picture = Picture.find params[:id]
    if @picture.user_id != @authenticated.id
      redirect_to picture_path(picture)
    end

    if picture.update_attributes params[:picture]
      redirect_to picture_path(picture)
    else
      render :new
    end
  end

  def show
    @picture = Picture.find params[:id]
  end







end