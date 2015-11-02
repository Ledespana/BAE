class BotsInteractionsController < ApplicationController
  def create
    @bot = Bot.find(params[:bot_id])
    @bots_interaction = BotsInteraction.new(bots_interaction_params)

    respond_to do |f|
      f.html {
        if @bots_interaction.save
          flash[:notice] = "Interaction added to #{@bot.name}!"
          redirect_to :back
        else
          flash[:errors] = "Something went wrong!"
          redirect_to :back
        end
      }
      f.js {
        @bots_interaction.save
      }
    end
  end

  def destroy
    @bot = Bot.find(params[:bot_id])
    @interaction = @bot.interactions.find(params[:id])
    @bots_interaction = BotsInteraction.where(
      bot_id: @bot.id,
      interaction_id: @interaction.id
    )
    respond_to do |f|
      f.html {
        if current_user
          @bots_interaction[0].destroy
          flash[:notice] = "Interaction removed successfully from #{@bot.name}"
          redirect_to :back
        else
          flash[:error] = "You have no permission to modify that"
          redirect_to :back
        end
      }

      f.js {
        @bots_interaction[0].destroy
      }
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
