class CategoriesController < ApplicationController

  def new
    @category = Category.new
    @users = User.all
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
    @categories = Category.all

  end

  def update
    category = Category.find params[:id]
    # if @picture.user_id != @authenticated.id
    #   redirect_to root_path
    # end
    if category.update_attributes params[:category]
      redirect_to :back
#      redirect_to user_path(@authenticated)
    else
      render :new
    end
  end

  def show
    @category = Category.find params[:id]

  end


  def destroy
    category = Category.find params[:id]
    if @category.user_id != @authenticated.id
      redirect_to root_path
    end
    category.destroy
    redirect_to root_path
  end








end