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
   @shops = current_user.like_shops
   @recipes = current_user.like_recipes

   if current_user.like_beans.count > 1
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

   @sweet = (@taste[:sweet] * 10).to_s + "%"
   @fruity = (@taste[:fruity] * 10).to_s + "%"
   @chocolate = (@taste[:chocolate] * 10).to_s + "%"
   @bitter = (@taste[:bitter] * 10).to_s + "%"
   # /====================================
       # Recommendation algorithm
   # ====================================/
   # putting all the taste values from use to array
   @rec_taste = Array.new
   @taste.each_value {|value| @rec_taste.push(value)}

   # putting all the taste values from beans to a hash with key bean_id and vlaue
   @beans_all = Bean.where("id NOT IN (?)", current_user.like_beans.pluck(:bean_id))
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

  #  # Recipes
  #
  #  # putting all the taste values from use to array
  #  @rec_taste = Array.new
  #  @taste.each_value {|value| @rec_taste.push(value)}
  #
  #  # putting all the taste values from beans to a hash with key bean_id and vlaue
  #  @recipes_all = Recipe.where("id NOT IN (?)", current_user.like_recipes.pluck(:recipe_id))
  #  @rec_recipe = Hash.new
  #
  #  @recipes_all.each do |recipe|
  #    @rec_recipe[recipe.id] = [recipe.sweet, recipe.fruity, recipe.bitter, recipe.chocolate]
  #  end
  #
  #  @rec_recipe.each do |key,value|
  #    print @rec_taste[0]
  #    print value[0]
  #    @rec_recipe[key] = Math.sqrt(((@rec_taste[0]-value[0])**2)+((@rec_taste[1]-value[1])**2)+((@rec_taste[2]-value[2])**2)+((@rec_taste[3]-value[3])**2) )
  #  end
  #
  #  @rec_recipe_num = Array.new
  #  @rec_recipe.each do |key,value|
  #    if value < 5
  #      @rec_recipe_num.push(key)
  #    end
  #  end
  #
  #  @rec_recipe_final = Array.new
  #  @rec_recipe_num.each do |f|
  #    @rec_recipe_final.push(Recipe.find(f))
  #  end


    # @user = User.friendly.find params[:id]
    # @beans = current_user.like_beans
    # @beanss = current_user.like_beans
    # @shops = current_user.like_shops
    # @recipes = current_user.like_recipes
    # @recommended_beans = BeanRecommendationEngine.new(current_user).recommended_beans
    taste_graph!
    end
  end

  private

  def user_params
    user_params = params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation,:avatar,:slug)
  end

  def taste_graph!
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

    @sweet = (@taste[:sweet] * 10).to_s + "%"
    @fruity = (@taste[:fruity] * 10).to_s + "%"
    @chocolate = (@taste[:chocolate] * 10).to_s + "%"
    @bitter = (@taste[:bitter] * 10).to_s + "%"

  end


end
