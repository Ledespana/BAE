# class UsersInteractionsController < ApplicationController
#
#   def create
#     @interaction = Interaction.find(params[:interaction_id])
#     @users_interaction = UsersInteraction.new(interaction_id: @interaction.id, user_id: current_user.id)
#
#     if @users_interaction.save
#       flash[:notice] = "Interaction saved!"
#       redirect_to :back
#     else
#       flash[:errors] = "Something went wrong!"
#       redirect_to :back
#     end
#   end
#
#
#   def destroy
#     @interaction = Interaction.find(params[:id])
#
#     @users_interaction = UsersInteraction.where( interaction: @interaction, user: current_user)
#     if current_user
#       @users_interaction.destroy
#       flash[:notice] = "Interaction removed from your vocabulary!"
#       redirect_to :back
#     else
#       flash[:errors] = "Something went wrong!"
#       redirect_to :back
#     end
#   end
#
# end
