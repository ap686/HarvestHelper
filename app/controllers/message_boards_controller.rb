class MessageBoardsController < ApplicationController
  def index
    if !signed_in?
      redirect_to root_path
    else
      @message_boards = MessageBoard.all
    end
  end

  def show
    if !signed_in?
      redirect_to root_path
    else
      @message_board = MessageBoard.find(params[:id])
    end
  end
end
