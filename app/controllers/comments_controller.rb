class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to book_path(@book)
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
    params.require(:comment).permit(:content, :user_id, :book_id)
  end
end
