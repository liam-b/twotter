class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
  end

  def create

    @post = Post.new post_params

    @post.title = current_user.email

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  private def post_params
    params.require(:post).permit(:title, :body)
  end

  def edit
    @post = Post.find params[:id]
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy

    redirect_to posts_path
  end

  def update
    @post = Post.find params[:id]

    if @post.update post_params
      redirect_to @post
    else
      render 'edit'
    end
  end
end
