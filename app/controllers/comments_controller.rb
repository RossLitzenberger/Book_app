class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @comment = Comment.create(comment_params)
    @comment.user_id = current_user.id
    @comment.book_id = @book.id
    if @comment.save
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = @book.comments.find(params[:id])
    @comment.destroy

    redirect_to book_path(@book)
  end
  def upvote
    @comment = Comment.find(params[:id])
    @comment.upvote_by current_user

    redirect_to :back
  end
  def downvote
    @comment = Comment.find(params[:id])
    @comment.downvote_by current_user

    redirect_to :back
  end
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
