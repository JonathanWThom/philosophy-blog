class DashboardController < ApplicationController
  def index
    @posts = Post.ordered
    @books = Book.ordered
  end
end
