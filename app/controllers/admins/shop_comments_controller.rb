class Admins::ShopCommentsController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    ShopComment.find_by(id: params[:id], shop_id: params[:shop_id]).destroy
    redirect_to request.referer
  end
end
