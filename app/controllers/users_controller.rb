class UsersController < ApplicationController
  def new
    @user = User.new
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
    @shops = current_user.like_shops
    @recipes = current_user.like_recipes

    # @taste = Hash.new(0)
    # @beans.each do |key,value|
    #   puts key
    #   if key == (:sweet || "fruity" || "bitter" || "chocolate")
    #     Hash[key] += value
    #   end
    # end

    @taste = { sweet: 0, fruity: 0, bitter: 0, chocolate: 0, counter: 0 }
    @beans.each do |bean|
      @taste[:sweet] += bean.sweet
      @taste[:fruity] += bean.fruity
      @taste[:bitter] += bean.bitter
      @taste[:chocolate] += bean.chocolate
      @taste[:counter] += 1
    end

    @recipes.each do |bean|
      @taste[:sweet] += bean.sweet
      @taste[:fruity] += bean.fruity
      @taste[:bitter] += bean.bitter
      @taste[:chocolate] += bean.chocolate
      @taste[:counter] += 1
    end
  end

  private

  def user_params
    user_params = params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation,:avatar,:slug)
  end


end
