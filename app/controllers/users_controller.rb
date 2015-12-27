class UsersController < ApplicationController
  def index
    n_page = params[:page]
    if params[:search]
      search = params[:search]
      @users = User.search(search).order("username").page(n_page).per(12)
    else
      @users = User.order("username").page(n_page).per(12)
    end
  end

  def show
    @user = User.find(params[:id])
    @bot = @user.bots[0]
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.role == "Admin"
      @user.destroy
      flash[:notice] = "User deleted successfully"
      redirect_to users_path
    else
      flash[:error] = "You have no permission to delete this account"
      redirect_to user_path(@user)
    end
  end
end
