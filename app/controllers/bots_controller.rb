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
    if signed_in?
      @user = User.find(params[:user_id])
      @bot = Bot.new
    else
      authenticate_user!
    end
  end

  def create
    @user = User.find(params[:user_id])
    @bot = @user.bots.new(bot_params)
    if @user.bots.count == 3
      flash[:notice] = "You have reached the limits of BAEs"
      redirect_to user_bots_path(@user)
    else
      if @bot.save
        flash[:notice] = "BAE created!"
        redirect_to user_bots_path(@user)
      else
        flash[:errors] = "Something went wrong!"
        redirect_to new_user_bot_path(@user)
      end
    end
  end

  def edit
      @user = User.find(params[:user_id])
    if signed_in? && current_user == @user
      @bot = Bot.find(params[:id])
    elsif !signed_in?
      authenticate_user!
    else
      @bot = Bot.find(params[:id])
      flash[:notice] = 'You have no permission to edit this BAE'
      redirect_to user_bot_path(@user, @bot)
    end
  end

  def update
    @user = User.find(params[:user_id])
    if signed_in? && current_user == @user
      @bot = Bot.find(params[:id])
      if @bot.update_attributes(bot_params)
        flash[:success] = 'BAE edited successfully'
        redirect_to user_path(@user)
      else
        flash[:alert] = 'Something went wrong'
        render :edit
      end
    elsif !signed_in?
      authenticate_user!
    else
      flash[:error] = 'You have no permission to edit this BAE'
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @bot = Bot.find(params[:id])
    if signed_in? && current_user == @bot.user
      @bot.destroy
      flash[:notice] = 'BAE deleted successfully'
      redirect_to user_bots_path(@user)
    elsif !signed_in?
      authenticate_user!
    else
      flash[:error] = 'You have no permission to delete this BAE'
      redirect_to user_bots_path(@user)
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
