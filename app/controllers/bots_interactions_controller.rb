class BotsInteractionsController < ApplicationController
  def destroy
    @bot = Bot.find(params[:bot_id])
    @interaction = @bot.interactions.find(params[:id])
    @bots_interaction = BotsInteraction.where(
      bot: @bot,
      interaction: @interaction
    )
    if current_user
      @bots_interaction.destroy
      flash[:notice] = "Interaction deleted successfully from your BAE"
      redirect_to user_interactions_path(@user)
    else
      flash[:error] = "You have no permission to modify that"
      redirect_to user_interactions_path(@user)
    end
  end

  def create
    @bot = Bot.find(params[:bot_id])
    @bots_interaction = BotsInteraction.new(bots_interaction_params)
    if @bots_interaction.save
      flash[:notice] = "Interaction added!"
      redirect_to :back
    else
      flash[:errors] = "Something went wrong!"
      redirect_to :back
    end
  end

  protected

  def bots_interaction_params
    params.require(:bots_interaction).permit(
      :interaction_id,
      :bot_id
    )
  end
end
