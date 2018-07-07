class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @books = Book.all
    @other_books = Book.order(created_at: :desc).offset(1)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
  
    respond_to do |format|
      format.js
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)

    respond_to do |format|
      format.js
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy

    redirect_to dashboard_path
  end

  private

  def book_params
    params.require(:book).permit(
      :author,
      :color,
      :description,
      :image_link,
      :title
    )
  end
end
