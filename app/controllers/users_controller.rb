class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    puts params
    @user = current_user
    @user.name = params[:user][:name]
    @user.time_zone = params[:user][:time_zone]
    @user.save
    redirect_to root_path
  end
end
