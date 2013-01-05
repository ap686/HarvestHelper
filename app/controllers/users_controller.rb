class UsersController < ApplicationController
  def show
    if !signed_in?
      redirect_to root_path
    else
      @user = User.find(params[:id])
    end
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  
  end
  
  def update
  
  end
  
  def destroy
  
  end
end
