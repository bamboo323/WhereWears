class Publics::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @shops = @user.shops
  end

  def mypage
    @user = current_user
    @shop = Shop.new
    @shops = @user.shops.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to mypage_publics_users_path
      flash[:notice] = "プロフィールの更新に成功しました"
    else
      render :edit
    end
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :introduction, :profile_image)
  end

end
