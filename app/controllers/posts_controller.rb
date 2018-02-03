class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.create(post_params)
    if post.valid?
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    ## could this be on the same page but just bring the post front and center?
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
