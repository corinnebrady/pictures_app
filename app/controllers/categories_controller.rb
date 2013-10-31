class CategoriesController < ApplicationController

  def new
    @category = Category.new
    @users = User.all
  end

  def create
    category = Category.create :name => params[:new_category], :owner_id => @authenticated.id

    params[:user].each do |user_id|
      user = User.find(user_id)
      user.categories << category
    end

    redirect_to root_path
  end


  def edit
    @category = Category.find params[:id]
    @users = User.all
  end

  def update
    @category = Category.find params[:id]

    @category.users = []

    params[:user].each do |user_id|
      user = User.find(user_id)
      if @category.owner_id == @authenticated.id
        user.categories << @category
      end
    end
    redirect_to category_path(@category)
  end

#   def update
#     category = Category.find params[:id]
#     # if @picture.user_id != @authenticated.id
#     #   redirect_to root_path
#     # end
#     if category.update_attributes params[:category]
#       redirect_to :back
# #      redirect_to user_path(@authenticated)
#     else
#       render :new
#     end
#   end

  def show
    @category = Category.find params[:id]

  end


  def destroy
    category = Category.find params[:id]
    if category.owner_id != @authenticated.id
      redirect_to root_path
    end
    category.destroy
    redirect_to root_path
  end

  def edit_user_categories
    @categories = Category.all
    @user = User.find params[:id]
  end

  def add_user_to_categories
    user = User.find params[:member_id]

    # remove the user from all authenticated's categories
    user.categories = user.categories.where('owner_id != ?', @authenticated.id)

    if params[:new_category].present?
      new_category = Category.create(:name => params[:new_category],
                                     :owner_id => @authenticated.id)
      new_category.users << user
    end
    params[:category].each do |category_id|
      category = Category.find(category_id)
      if category.owner_id == @authenticated.id
        category.users << user
      end
    end
    redirect_to user_path(user)
  end

end