class BeanRecommendationEngine
  attr_accessor :user, :taste_profile

  def initialize(user)
    @user = user
    setup_taste_profile
  end

  def setup_taste_profile
    self.taste_profile = { sweet: 0, fruity: 0, bitter: 0, chocolate: 0}
    counter = 0

    user.like_beans.each do |bean|
      taste_profile[:sweet] += bean.sweet
      taste_profile[:fruity] += bean.fruity
      taste_profile[:bitter] += bean.bitter
      taste_profile[:chocolate] += bean.chocolate
      counter += 1
    end

    user.like_recipes.each do |recipe|
      taste_profile[:sweet] += recipe.sweet
      taste_profile[:fruity] += recipe.fruity
      taste_profile[:bitter] += recipe.bitter
      taste_profile[:chocolate] += recipe.chocolate
      counter += 1
    end

    taste_profile.each do |key,value|
      taste_profile[key] = value / counter
    end
  end

  def recommended_beans
    # /====================================
      # Recommendation algorithm
    # ====================================/

    # putting all the taste values from use to array
    rec_taste = taste_profile.values

    # putting all the taste values from beans to a hash with key bean_id and value
    beans_user_has_not_liked = Bean.where("id NOT IN (?)", user.like_beans.pluck(:bean_id))
    rec_bean = Hash.new

    beans_user_has_not_liked.each do |bean|
      rec_bean[bean.id] = [bean.sweet, bean.fruity, bean.bitter, bean.chocolate]
    end

    rec_bean.each do |key,value|
      rec_bean[key] = Math.sqrt(((rec_taste[0]-value[0])**2)+((rec_taste[1]-value[1])**2)+((rec_taste[2]-value[2])**2)+((rec_taste[3]-value[3])**2) )
    end

    recommended_bean_ids = rec_bean.select{|k,v| v < 5}.keys
    Bean.where(id: recommended_bean_ids)
  end






end
