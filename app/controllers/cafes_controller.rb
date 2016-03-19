class CafesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @cafe = Cafe.new
  end

  def create
    @cafe = Cafe.new cafe_params
    if @cafe.save
      redirect_to user_cafes
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

  def cafe_params
    cafe_params = params.require(:cafe).permit(:name,:address,:website,:user_id)
  end

  def find_cafe
    @cafe = Cafe.find params(:cafe_id)
  end
end
