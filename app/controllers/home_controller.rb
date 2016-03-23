class HomeController < ApplicationController
  def index
    @shop = Shop.first
  end
end
