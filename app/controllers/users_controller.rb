class UsersController < ApplicationController
  def index
    if params[:search]
      search = params[:search]
      n_page = params[:page]
      @users = User.search(search).order("username").page(n_page).per(10)
    else
      @users = User.all.order("username").page(n_page).per(10)
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
