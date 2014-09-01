class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  helper :all

  def check_user_login
     if session[:user_id]
       @current_user = User.find(session[:user_id])
     elsif session[:doctor_id]
       @current_user = User.find(session[:doctor_id])
       
     end
  end
end
