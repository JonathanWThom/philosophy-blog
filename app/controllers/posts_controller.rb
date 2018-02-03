class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  ## needs flashes

  def index
    @posts = Post.order(created_at: :desc).limit(5)
    @other_posts = Post.where.not(id: @posts.pluck(:id)).limit(5)
    ## I want to load the next 5 always

    respond_to do |format|
      format.html
      format.js
    end
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
    ## could this be on the same page but just bring the post front and center?
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to dashboard_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
