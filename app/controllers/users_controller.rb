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
  def edit
    user = User.find(params[:id])
    unless user.id == current_user.
      redirect_to #リンク先の確認してから入力
    end
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      flash[:notice] = "ログアウトしました"
      redirect_to 'homes/top'
    else 
      @user = User.allocate
      flash.now[:notice] = "ログアウトに失敗しました"
      render :users_path
    end
    
  end

  
  private

  def users_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
