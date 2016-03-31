class BeanLikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @bean_like = current_user.bean_likes.new
    @bean = Bean.find params[:bean_id]
    @bean_like.bean = @bean
    if @bean_like.save
      redirect_to @bean, notice: "Liked!"
    else
      redirect_to @bean, notice: "Can't be liked!"
    end
  end

  def destroy
    @bean = Bean.find params[:bean_id]
    @bean_like = current_user.bean_likes.find params[:id]
    @bean_like.destroy
    redirect_to @bean, notice: "Unliked"
  end
end
