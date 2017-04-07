class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @posts = Post.last(10)
    @postsnested = [[@posts[0], @posts[1], @posts[2]], [@posts[3], @posts[4], @posts[5]], [@posts[6], @posts[7], @posts[8]]]
  end

  def new
    @post = Post.new
  end

  def create
    post_params = params.require(:post).permit([:title, :body, :category_id])

    @post = Post.new (post_params)
    if @post.save
      redirect_to post_path({id: @post.id })
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
    # try to limit number of the displaying comments
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to posts_path, notice:'Post Deleted'
    # render plain: 'in question destroy'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    post_params = params.require(:post).permit([:title, :body, :category_id])
    if @post.update(post_params)
      flash[:notice] = "Post Updated"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
end
