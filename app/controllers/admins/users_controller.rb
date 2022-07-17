class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @shops = @user.shops
  end

  def edit
    @user = User.find(params[:id])
  end

  def out
    @user = User.find(params[:id])
    #is_deletedカラムをtrueに変更することにより、退会扱いにする
    @user.update(is_deleted: true)
    redirect_to admins_users_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admins_user_path(@user)
    end
  end


  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :introduction, :email, :is_deleted)
  end

end
