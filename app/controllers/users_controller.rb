class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def view
    @user = User.find(params[:id])
    if current_user && current_user.admin
      @user = User.find(params[:id])
    else
      redirect_to '/books'
    end
  end

  def make_admin
    @user = User.find(params[:id])
    @user.admin = true
    @user.save
    redirect_to "/users"
  end

  def remove_admin
    @user = User.find(params[:id])
    @user.admin = false
    @user.save
    redirect_to "/users"
  end
end