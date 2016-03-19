class BeansController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_bean, only: [:show,:destroy,:edit,:update]

  def new
    @bean = Bean.new
  end

  def create
    @bean = Bean.new bean_params
    if @bean.save
      redirec_to beans_path, alert: "Bean created"
    else
      flash[:alert] = "Unable to create been"
      render :new
    end
  end

  def index
    @beans = Bean.all
  end

  def show
  end

  def edit
  end

  def update
    if @bean.update bean_params
      redirect_to bean_path(@bean), alert: "Updated"
    else
      render :edit
    end
  end

  def destroy
    @bean.destroy
    redirect_to beans_path
  end

  private

  def bean_params
    bean_params = params.require(:bean).permit(:name,:region,:producer,:user_id)
  end

  def find_bean
    @bean = Bean.find params[:id]
  end
end
