class Api::V1::AuthorsController < ApplicationController
  before_action :set_author, only: %i[destroy show]
  def index
    @author = current_user.author.all
  end

  def create
    @author = current_user.books.new(author_params)

    if @author.save!
      render :create, status: :created
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @author.destroy
      render json: { message: 'author has been successfully deleted' }
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  def update
    if @author.update(author_params)
      render :update, status: :ok
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  def set_author
    @author = Author.find(param[:id])
  end

  def author_params
    params.require(:author).permit(:name, :created_by)
  end
end
