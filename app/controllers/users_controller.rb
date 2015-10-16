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
end
