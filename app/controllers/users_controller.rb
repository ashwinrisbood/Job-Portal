class UsersController < ApplicationController
  include Devise::Controllers::Helpers
  before_action :authenticate_user!
  before_action :redirect_unless_admin

  def redirect_unless_admin
    unless !user_signed_in? or current_user.isAdmin?
      flash[:notice] = "Only admins can do that"
      redirect_to root_path
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if current_user == @user
      redirect_to users_path, notice: "You can't destroy yourself."
    else
      @user.destroy
      flash[:success] = "User destroyed."
      redirect_to users_path
    end
  end
end
