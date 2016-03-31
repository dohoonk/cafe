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
    @user = User.find params[:id]
  end

  private

  def user_params
    user_params = params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation,:avatar)
  end

end
