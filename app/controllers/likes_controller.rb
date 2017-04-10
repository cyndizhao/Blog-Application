class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])      
    @like = Like.new
    @like.post = @post
    @like.user = current_user


    success = @like.save

    if success

      redirect_to post_path(@post), notice:'Liked'
    else
      render '/posts/show'
    end
  end
end
