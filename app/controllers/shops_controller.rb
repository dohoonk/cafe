class ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_shop, only: [:show,:destroy]

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new shop_params
    if @shop.save
      redirect_to shops_path
    else
      render :new
    end
  end

  def index
    @shops = Shop.all
  end

  def show
  end

  def destroy
    @shop.destroy
  end

  private

  def shop_params
    shop_params = params.require(:shop).permit(:phone_number,:name,:address,:website,:user_id)
  end

  def find_shop
    @shop = Shop.find params[:id]
  end
end
