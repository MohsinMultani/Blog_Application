class CommentsController < ApplicationController

  def create
    @blog = Blog.find(params[:blog_id])
    attributes = params.require(:comment).permit(:text)
    @comment = @blog.comments.build(attributes)
    @comment.user_id = current_user.id
    @comment.save
    @comments = @blog.comments
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @blog = Blog.find(params[:blog_id])
    @comments = @blog.comments
  end
  
end