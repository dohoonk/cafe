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

    @counter = 0
    @taste = { sweet: 0, fruity: 0, bitter: 0, chocolate: 0}
    @beans.each do |bean|
      @taste[:sweet] += bean.sweet
      @taste[:fruity] += bean.fruity
      @taste[:bitter] += bean.bitter
      @taste[:chocolate] += bean.chocolate
      @counter += 1
    end

    @recipes.each do |bean|
      @taste[:sweet] += bean.sweet
      @taste[:fruity] += bean.fruity
      @taste[:bitter] += bean.bitter
      @taste[:chocolate] += bean.chocolate
      @counter += 1
    end

    @taste.each do |key,value|
      @taste[key] = value / @counter
    end

    # /====================================
      # Recommendation algorithm
    # ====================================/

    # putting all the taste values from use to array
    @rec_taste = Array.new
    @taste.each_value {|value| @rec_taste.push(value)}

    # putting all the taste values from beans to a hash with key bean_id and vlaue
    @beans_all = Bean.all
    @rec_bean = Hash.new

    @beans_all.each do |bean|
      @rec_bean[bean.id] = [bean.sweet, bean.fruity, bean.bitter, bean.chocolate]
    end

    @rec_bean.each do |key,value|
      print @rec_taste[0]
      print value[0]
      @rec_bean[key] = Math.sqrt(((@rec_taste[0]-value[0])**2)+((@rec_taste[1]-value[1])**2)+((@rec_taste[2]-value[2])**2)+((@rec_taste[3]-value[3])**2) )
    end

    @rec_bean_num = Array.new
    @rec_bean.each do |key,value|
      if value < 5
        @rec_bean_num.push(key)
      end
    end

    @rec_bean_final = Array.new
    @rec_bean_num.each do |f|
      @rec_bean_final.push(Bean.find(f))
    end

    # print @rec_bean.group_by{|k, v| v}.min_by{|k, v| k}.last



  end

  private

  def user_params
    user_params = params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation,:avatar,:slug)
  end


end
