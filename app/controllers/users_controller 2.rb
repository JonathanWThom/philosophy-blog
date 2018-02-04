class UsersController < ApplicationController
  def index
    credentials = current_user.aws_credentials
    render json: credentials
  end
end
