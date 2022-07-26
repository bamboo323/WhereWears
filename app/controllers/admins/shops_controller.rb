class Admins::ShopsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @shops = Shop.all.page(params[:page])
  end

  def show
    @shop = Shop.find(params[:id])
    @shop_comments =ShopComment.all
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
   @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to admins_shop_path(@shop), notice: "ショップの更新に成功しました"
    else
      render "edit"
    end
  end

  def destroy
    @shop =Shop.find(params[:id])
    @shop.destroy
    redirect_to admins_shops_path
    flash[:alart] = "ショップを削除しました"

  end

  private
  def shop_params
    params.require(:shop).permit(:shop_name, :shop_address, :shop_detail, :shop_image, :genre_id, :star, :status)
  end

end
