class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  private
  before_action :login_required
  before_action :my_page_access
  def login_required
  redirect_to new_session_path unless current_user
  end
  def my_page_access
#    if current_user.id.to_s != params[:id]
    if current_user.id != Picture.find_by(id: params[:id]).user_id && current_user.id.to_s != params[:id] && current_user.id != params[:id]
    redirect_to user_path(current_user.id)
    binding.pry
    end
  end
end
