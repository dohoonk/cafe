class BeanShopsController < ApplicationController
  def create
    @bean_shop = BeanShop.new
    @shop = Shop.friendly.find params[:shop_id]
    @bean = params[bean_id]
    @bean_shop.shop = @shop
    @bean_shop.bean = @bean
    if @bean_shop.save
      redirect_to @shop
    else
      redirect_to @shop
    end
  end

  # def destroy
  #   @bean = Bean.friendly.find params[:bean_id]
  #   @bean_like = current_user.bean_likes.find params[:id]
  #   @bean_like.destroy
  #   redirect_to @bean, notice: "Unliked"
  # end
end
