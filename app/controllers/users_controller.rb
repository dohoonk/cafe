class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update user_params
      redirect_to user_path(@user), alert: "Updated"
    else
      render :edit
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, alert: "Account Created"
    else
      flash[:alert] = "Failed to create an account"
      render :new
    end
  end

  def show
    @user = User.friendly.find params[:id]
    @beans = current_user.like_beans
    @beanss = current_user.like_beans
    @shops = current_user.like_shops
    @recipes = current_user.like_recipes

    @recommended_beans = BeanRecommendationEngine.new(current_user).recommended_beans

    # print @rec_bean.group_by{|k, v| v}.min_by{|k, v| k}.last



  end

  private

  def user_params
    user_params = params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation,:avatar,:slug)
  end


end
