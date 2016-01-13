class CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.create(params[:comment].permit(:name, :body))

    redirect_to book_path(@book)
  end
end
