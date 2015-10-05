class UsersController < ApplicationController

  def index
    if params[:search]
      search = params[:search]
      @users = User.search(search).order("email")
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
