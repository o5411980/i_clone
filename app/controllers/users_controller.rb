class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
#  skip_before_action :my_page_access, only: [:new, :create, :show]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice: 'your account created'
    else
      render :new
    end
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice: "ユーザ情報を更新しました"
    else
      render :edit
    end
  end
  def my_favorite
    @user = User.find(params[:id])
    @my_favorite = current_user.favorite_pictures
  end
  private
  def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image, :profile_image_cache)
  end
end
