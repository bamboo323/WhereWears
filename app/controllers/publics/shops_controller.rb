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
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :shop_address, :shop_detail, :shop_image, :genre_id)
  end

end
