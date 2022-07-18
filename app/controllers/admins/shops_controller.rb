class Admins::ShopsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
   @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      #byebug
      redirect_to admins_shop_path(@shop)
    else
      render "edit"
    end
  end

  private
  def shop_params
    params.require(:shop).permit(:shop_name, :shop_address, :shop_detail, :shop_image, :genre_id, :star, :status)
  end

end
