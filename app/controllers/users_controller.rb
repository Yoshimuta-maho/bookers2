class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Book was successfully created."
      redirect_to user_path(@user)
    else
      @user = User.all
      flash.now[:notice] = "errors prohibited this book from being saved:"
      render :edit
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to 'homes/top'
  end

  
  private

  def users_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
