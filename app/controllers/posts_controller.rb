class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_posts, only: [:index, :show]

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.create(post_params)
    if post.valid?
      sweetalert_success("Post was saved")
      redirect_to dashboard_path
    else
      sweetalert_error(post.errors.full_messages.first)
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      sweetalert_success("Post was updated")
      redirect_to dashboard_path
    else
      sweetalert_error(@post.errors.full_messages.first)
      render :edit
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
    params.require(:post).permit(:title, :body, :book_id)
  end

  def find_posts
    @posts = Post.includes(:book).ordered
  end
end
