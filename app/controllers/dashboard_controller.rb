class DashboardController < ApplicationController
  def index
    @posts = Post.ordered
  end
end
