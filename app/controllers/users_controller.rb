class UsersController < ApplicationController
  before_filter :check_if_logged_in, :except => [:new, :create]
  before_filter :check_if_admin, :only => [:destroy]

  def index
    @users = User.all
    @user = @authenticated
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]


    if @user.save
      session[:user_id] = @user.id
      category = Category.create :name => 'All', :owner_id => @user.id
      category.users = User.all
#wishlist- add future users
      redirect_to pictures_path

    else
      render :new
    end


  end

  def edit
    @user = @authenticated
    render :new
  end

  def update
    @user = @authenticated
    if @user.update_attributes params[:user]
      redirect_to user_path(@authenticated)
    else
      render :new
    end
  end

  def show
    @user = User.find params[:id]
    @picture = Picture.new
  end

  def favourites
    @user = User.find params[:id]
    @favourites = @user.favourites
  end



  private
  def check_if_logged_in
    redirect_to(root_path) unless @authenticated.present?
  end

  def check_if_admin
    redirect_to(root_path) unless @authenticated.present? && @authenticated.is_admin?
  end
end
