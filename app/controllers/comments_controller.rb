class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(params[:comment])
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to @comment.post
    else
      redirect_to message_board_path
    end
  end

  def destroy
  end

end
