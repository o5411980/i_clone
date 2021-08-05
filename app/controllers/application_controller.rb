class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :login_required
  before_action :my_user_page_access
  before_action :my_picture_page_access
  private
  def login_required
  redirect_to new_session_path unless current_user
  end
  def my_picture_page_access
  if current_user.id != Picture.find_by(id: params[:id]).user_id
  redirect_to user_path(current_user.id)
  end
  end
  def my_user_page_access
  if current_user.id.to_s != params[:id] && current_user.id != params[:id]
  redirect_to user_path(current_user.id)
  end
  end
  end
