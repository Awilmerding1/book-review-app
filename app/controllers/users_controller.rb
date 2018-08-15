class UsersController < ApplicationController
  before_action :require_login


  def home
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
    else
      redirect_to '/'
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end



end
