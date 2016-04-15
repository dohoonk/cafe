class HomeController < ApplicationController
  layout "home"
  def index
    @beans = Bean.first(3)
    @shops = Shop.first(3)
    @recipes = Recipe.first(3)
  end
end
