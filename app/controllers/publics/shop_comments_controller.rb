class Publics::ShopCommentsController < ApplicationController
  def create
    shop = Shop.find(params[:shop_id])
    comment = current_user.shop_comments.new(shop_comment_params)
    comment.shop_id = shop.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    ShopComment.find_by(id: params[:id], shop_id: params[:shop_id]).destroy
    redirect_to request.referer
  end

  private

  def shop_comment_params
    params.require(:shop_comment).permit(:comment)
  end

end
