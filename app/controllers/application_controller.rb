class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # include the following methods in the views
  helper_method :current_user, :logged_in?

  private
  # sets the user's sessions
  def current_user
		return unless session[:user_id]
	  @current_user ||= User.find(session[:user_id])
    
  end

  # checks to see if there's a user logged in
  def logged_in?
    !current_user.nil?
  end

  include SessionsHelper
end
