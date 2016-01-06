class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit]

  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end
end
