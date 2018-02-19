class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_posts, only: [:index, :show]

  ## needs flashes

  def index
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.create(post_params)
    if post.valid?
      redirect_to dashboard_path
    else
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to dashboard_path
    else
      redirect_to edit_post_path(post)
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to dashboard_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_posts
    @posts = Post.ordered
  end
end
