class AdminController < ApplicationController
  before_action :is_admin

  def index
    @users = User.all
  end

  def promote
    @user = User.find(params[:id])
    if @user.is_admin
      @user.update_attribute(:is_admin, false)
    else
      @user.update_attribute(:is_admin, true)
    end
    redirect_to admin_path
  end

  private
  # method to check user is signed in and is an admin
  def is_admin
    redirect_to "/404.html" unless user_signed_in? && current_user.is_admin
  end
end
