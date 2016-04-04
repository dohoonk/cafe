class ShopLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @shop_like = current_user.shop_likes.new
    @shop = Shop.friendly.find params[:shop_id]
    @shop_like.shop = @shop
    if @shop_like.save
      redirect_to @shop, notice: "Liked!"
    else
      redirect_to @shop, notice: "Can't be liked!"
    end
  end

  def destroy
    @shop = Shop.friendly.find params[:shop_id]
    @shop_like = current_user.shop_likes.find params[:id]
    @shop_like.destroy
    redirect_to @shop, notice: "Unliked"
  end
end
