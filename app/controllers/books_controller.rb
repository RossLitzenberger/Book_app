class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, only: [:index, :show]
  def index
    @books = Book.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)

  end

  def show
  end

  def new
    @book = current_user.books.build
  end

  def edit
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def update

    if @book.update_attributes(book_params)
      redirect_to @book
    else
      render book_path
    end
  end

  def destroy
    @book.delete.save

    redirect_to root_path
  end

  def upvote
    @book.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @book.downvote_by current_user
    redirect_to :back
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:book_name, :author, :description ,:illustator, :cover, :user_id)
    end
end
