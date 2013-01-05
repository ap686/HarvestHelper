class PostsController < ApplicationController
  def show
    if !signed_in?
      redirect_to root_path
    else
      @post = Post.find(params[:id])
      @comment = Comment.new
    end
  end

  def new
    if !signed_in?
      redirect_to root_path
    else
      @post = Post.new
      @message_board_id = params[:board_id]
    end
  end

  def create
    @post = current_user.posts.build(params[:post])
    @post.message_board_id = params[:message_board_id]
    if @post.save
      redirect_to @post
    else
      puts @post.errors.messages
      render 'new'
    end
  end

  def destroy
  end
end
