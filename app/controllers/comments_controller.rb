class CommentsController < ApplicationController

  def create

    @blog = Blog.find(params[:blog_id])
    attributes = params.require(:comment).permit(:text)
    @comment = @blog.comments.build(attributes)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to blog_path(params[:blog_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy  
    redirect_to blog_path(params[:blog_id])
  end
  
end