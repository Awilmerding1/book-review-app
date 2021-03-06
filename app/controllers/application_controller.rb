require 'rack-flash'

class ApplicationController < ActionController::Base


  helper_method :require_login, :logged_in?, :current_user, :current_user_first_name

  def require_login
    unless session.include? :user_id
      redirect_to '/'
      flash[:notice] = "You must login to view that page."
    end
  end

  def logged_in?
     current_user != nil
  end

  def current_user
    if session[:user_id]
     @user = User.find(session[:user_id])
   end
  end

  def current_user_first_name
    if session[:user_id]
     @user = User.find(session[:user_id])
     @user.name.split(" ").first
   end
  end



end
