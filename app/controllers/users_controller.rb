class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def users_params
    params.require(:user).permit(:name, :introduction)
  end
end
