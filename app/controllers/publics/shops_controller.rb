class Publics::ShopsController < ApplicationController
  before_action :authenticate_user!

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    if @shop.save!
      redirect_to publics_shops_path
    end
  end

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @shop_comment = ShopComment.new
  end

  def edit
    @shop = Shop.find(params[:id])
    if @shop.user == current_user
    else
      redirect_to publics_shops_path
    end
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to mypage_publics_users_path
    else
      render "edit"
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to mypage_publics_users_path
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :shop_address, :shop_detail, :shop_image, :genre_id)
  end

end
