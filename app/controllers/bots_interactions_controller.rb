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
end
