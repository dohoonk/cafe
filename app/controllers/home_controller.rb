class HomeController < ApplicationController
  layout "home"
  def index
    @beans = Bean.limit(3)
    @shops = Shop.limit(3)
    @recipes = Recipe.limit(3)
  end
end
