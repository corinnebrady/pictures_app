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

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_show_pictures_path
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
    @user = @authenticated
    @picture = Picture.new
  end


  private
  def check_if_logged_in
    redirect_to(root_path) unless @authenticated.present?
  end

  def check_if_admin
    redirect_to(root_path) unless @authenticated.present? && @authenticated.is_admin?
  end
end
