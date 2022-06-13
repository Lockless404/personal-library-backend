class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: %i[destroy show]
  def index
    @books = current_user.books.all
  end

  def create
    @book = current_user.books.new(room_params)

    if @book.save!
      render :create, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @book.destroy
      render json: { message: 'Book has been successfully deleted' }
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render :update, status: :ok
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def set_book
    @book = Book.find(param[:id])
  end

  def room_params
    params.require(:book).permit(:name, :author, :created_by)
  end
end
