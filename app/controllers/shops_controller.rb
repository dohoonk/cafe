class ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @shop = shop.new
  end

  def create
    @shop = shop.new shop_params
    if @shop.save
      redirect_to user_shops
    else
    end
  end

  def index
  end

  def show
  end

  def destroy
  end

  private

  def shop_params
    shop_params = params.require(:shop).permit(:name,:address,:website,:user_id)
  end

  def find_shop
    @shop = shop.find params(:shop_id)
  end
end
