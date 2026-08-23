class ApplicationController < ActionController::Base
  def user_signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id]) 
  end

  helper_method :user_signed_in?, :current_user
end
