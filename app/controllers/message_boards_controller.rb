class MessageBoardsController < ApplicationController
  def index
    if user_signed_in?
      @message_boards = MessageBoard.all
      respond_to do |format|
        format.html redirect_to(message_boards_path)
      end
    else
      redirect_to root_path
    end
  end

  def show
    if !user_signed_in?
      redirect_to root_path
    else
      @message_board = MessageBoard.find(params[:id])
    end
  end
end
