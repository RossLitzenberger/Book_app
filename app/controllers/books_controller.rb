class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)

  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to books_path
    else
      render book_path
    end
  end

  def destroy
    @book.delete.save

    redirect_to root_path
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:book_name, :author, :illustator, :cover)
    end
end
