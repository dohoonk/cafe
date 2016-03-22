class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_commentable

  def create
    @comment = Comment.new comment_params
    @comment.commentable = @commentable
    if @comment.save
      redirect_to @commentable, notice: "Comment created"
    else
      folder_name = @commentable.class.to_s.underscore.pluralize
      render "/#{folder_name}/show"
    end
  end

  def destroy
    @commentable.destroy
    folder_name = @commentable.class.to_s.underscore.pluralize
    render "/#{folder_name}/show"
  end

  private

  def comment_params
    comment_params = params.require(:comment).permit(:body)
  end

  def find_commentable
    if params[:bean_id]
      @bean = @commentable = Bean.find params[:bean_id]
    elsif params[:recipe_id]
      @recipe = @commentable = Recipe.find params[:recipe_id]
    elsif params[:shop_id]
      @shop = @commentable = Shop.find params[:shop_id]
    end
  end
end
