class UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to user_path(@user)
    else
      @user = User.all
      flash.now[:notice] = "errors prohibited this book from being saved:"
      render 'homes/top'
    end
  end
  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      flash[:notice] = "Signed out successfully."
      redirect_to 'homes/top'
    else 
      @user = User.allocate
      flash.now[:notice] = "ログアウトに失敗しました"
      render :users_path
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(users_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to users_path(user.id)
    else 
      @user = User.allocate
      flash.now[:notice] = "失敗しました"
      render :edit
    end
  end


  
  private

  def users_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
