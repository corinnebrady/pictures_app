class UsersController < ApplicationController
  before_filter :check_if_logged_in, :except => [:new, :create]
  before_filter :check_if_admin, :only => [:destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]

    @user.image = 'default_user_picture.png' unless @user.image.present?

    if @user.save
      session[:user_id] = @user.id
      category = Category.create :name => 'All', :owner_id => @user.id
      category.users = User.all
#wishlist- add future users
      redirect_to root_path

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
      redirect_to root_path
    else
      render :new
    end
  end

  def show
 #   @user = @authenticated
    @user = User.find params[:id]
    @picture = Picture.new
  end

  def favourites
    @favourites = Favourite.all
    @pictures = Picture.all
  end



  private
  def check_if_logged_in
    redirect_to(root_path) unless @authenticated.present?
  end

  def check_if_admin
    redirect_to(root_path) unless @authenticated.present? && @authenticated.is_admin?
  end
end
