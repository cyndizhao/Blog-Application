class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    comment_params = params.require(:comment).permit(:body)
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    success = @comment.save

    if success

      redirect_to post_path(@post), notice:'Comment Created'
    else
      render '/posts/show'
    end
  end

  def destroy
    comment = Comment.find(params[])
  end
end
