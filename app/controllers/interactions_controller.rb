class InteractionsController < ApplicationController
  def index
    @interactions = Interaction.all
  end

  # def new
  #   if signed_in?
  #     @interaction = Interaction.new
  #   else
  #     authenticate_user!
  #   end
  # end

  # def create
  #   @interaction = Interaction.new(interaction_params)
  #
  #   if @interaction.save
  #     BotsInteraction.create(@interaction, @bot)
  #     flash[:notice] = "Interaction created!"
  #     redirect_to user_bots_path(@current_user)
  #   else
  #     flash[:errors] = "Something went wrong!"
  #     redirect_to new_interaction_path
  #   end
  # end

  protected

  def interaction_params
    params.require(:interaction).permit(
      :sentiment,
      :keyword1,
      :keyword2,
      :sentence,
      :response,
      :description,
    )
  end
end
