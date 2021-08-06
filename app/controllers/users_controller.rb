class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :my_favorite]
  skip_before_action :login_required, only: [:new, :create]
  skip_before_action :my_user_page_access, only: [:new, :create, :show, :my_favorite]
  skip_before_action :my_picture_page_access
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id), notice: 'アカウントが作成されました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice: "ユーザ情報を更新しました"
    else
      render :edit
    end
  end

  def my_favorite
    @my_favorite = current_user.favorite_pictures
  end
  private
  def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image, :profile_image_cache)
  end

  def set_user
  @user = User.find(params[:id])
  end
end
