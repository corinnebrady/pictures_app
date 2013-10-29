class CategoriesController < ApplicationController

  def new
    @categories = Category.new
  end

  def create
    @category = Category.new params[:category]
    @category.user = @authenticated
    if @category.save
      redirect_to user_path(@authenticated)
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find params[:id]
    render :new
  end

  def update
    category = Category.find params[:id]
    if @picture.user_id != @authenticated.id
      redirect_to root_path
    end
    if category.update_attributes params[:category]
      redirect_to user_path(@authenticated)
    else
      render :new
    end
  end


    if @category.update_attributes params[:user]
      redirect_to root_path
    else
      render :new
    end
  end











end