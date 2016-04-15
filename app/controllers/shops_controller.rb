class ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_shop, only: [:show,:destroy,:update,:edit]

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new shop_params
    @shop.user_id = current_user.id
    if @shop.save
      redirect_to shops_path
    else
      render :new
    end
  end

  def index
    @shops = Shop.order("name").page(params[:page]).per(6)
    if params[:search]
    @shops = Shop.search(params[:search]).order("name").page(params[:page]).per(6)
    else
    @shops = Shop.all.order('name').page(params[:page]).per(6)
    end
    respond_to do |format|
      format.html
      format.js {render :shop_search}
    end
  end

  def show
    # @bean = @shop.beans
    @comment = Comment.new
    @commentable = @shop
    @shop_like = @shop.shop_like_for(current_user)
  end

  def edit
    can_authorize(:edit,@shop)
  end

  def update
    can_authorize(:update,@shop)
    if @shop.update shop_params
      redirect_to shop_path(@shop), alert: "Updated"
    else
      flahs[:alert] = "Failed to update"
      render :edit
    end
  end

  def destroy
    can_authorize(:destroy,@shop)
    @shop.destroy
  end

  private

  def shop_params
    shop_params = params.require(:shop).permit(:phone_number,:name,:address,:website,:user_id,:cafeimg,:slug,:bean_id)
  end

  def find_shop
    @shop = Shop.friendly.find params[:id]
  end
end
