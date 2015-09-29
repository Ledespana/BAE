class BotsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @bots = @user.bots
  end

  def show
    @user = User.find(params[:user_id])
    @bot = Bot.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @bot = Bot.new
  end

  def create
    @user = User.find(params[:user_id])
    @bot = @user.bots.new(bot_params)
    if @bot.save
      flash[:notice] = "BAE created!"
      redirect_to user_bots_path
    else
      flash[:errors] = "Something went wrong!"
      redirect_to new_user_bot_path
    end

  end

  protected

  def bot_params
    params.require(:bot).permit(
      :name,
      :gender,
      :age,
      :eye_color,
      :hair_color,
      :description,
      :user_id
    )
  end
end
