class Publics::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @shops = @user.shops
  end

  def mypage
    @user = current_user
    @shop = Shop.new
    @shops = @user.shops
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to mypage_publics_users_path
    end
  end

  def exit
  end

  def out
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :introduction, :profile_image)
  end

end
