class CommentsController < ApplicationController
  before_action :set_post , only: [:create]
  before_action :authenticate_user!
  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(@post), notice: 'Comment added successfully.'
    else
      redirect_to post_path(@post), alert: @comment.errors.full_messages.to_sentence
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:body , :post_id)
  end

  def set_post
    @post = Post.friendly.find(params[:post_id])
  end
end
