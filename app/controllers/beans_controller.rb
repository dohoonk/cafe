class BeansController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_bean, only: [:show,:destroy,:edit,:update]

  def new
    @bean = Bean.new
  end

  def create
    @bean = Bean.new bean_params
    @bean.user_id = current_user.id
    if @bean.save
      redirect_to beans_path, alert: "Bean created"
    else
      flash[:alert] = "Unable to create been"
      render :new
    end
  end

  def index
    @beans = Bean.order("name").page(params[:page]).per(6)
    if params[:search]
    @beans = Bean.search(params[:search]).order("name").page(params[:page]).per(6)
    else
    @beans = Bean.all.order('name').page(params[:page]).per(6)
    end
  end

  def show
    @comment = Comment.new
    @commentable = @bean
    @bean_like = @bean.bean_like_for(current_user)
  end

  def edit
    can_authorize(:edit, @bean)
  end

  def update
    can_authorize(:update, @bean)
    if @bean.update bean_params
      redirect_to bean_path(@bean), alert: "Updated"
    else
      render :edit
    end
  end

  def destroy
    can_authorize(:destroy, @bean)
    @bean.destroy
    redirect_to beans_path
  end

  private

  def bean_params
    bean_params = params.require(:bean).permit(:name,:region,:producer,:user_id,:beanimg,:slug,:roast,:sweet,:fruity,:bitter,:chocolate)
  end

  def find_bean
    @bean = Bean.friendly.find params[:id]
  end
end
