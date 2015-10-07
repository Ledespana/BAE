class InteractionsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @sentences = @user.interactions.where(
      category: "Sentence"
    ).order("Sentence")
    @keywords = @user.interactions.where(category: "Keyword").order("Keyword1")
    @combo = @user.interactions.where(category: "Combo").order("Keyword1")
  end

  def new
    @user = User.find(params[:user_id])
    if current_user == @user
      @interaction = Interaction.new
    else
      flash[:errors] = "You have no permission to do that!"
      redirect_to user_interactions_path(@user)
    end
  end

  def create
    @user = User.find(params[:user_id])
    if current_user == @user
      @interaction = @user.interactions.new(interaction_params)
      if @interaction.save
        UsersInteraction.create(user: @user, interaction: @interaction)
        flash[:notice] = "Interaction created!"
        redirect_to user_interactions_path(@user)
      else
        flash[:errors] = "Something went wrong!"
        redirect_to new_user_interaction_path
      end
    else
      flash[:errors] = "You have no permission to do that!"
      redirect_to user_interactions_path(@user)
    end
  end

  protected

  def interaction_params
    params.require(:interaction).permit(
      :category,
      :sentiment,
      :keyword1,
      :keyword2,
      :sentence,
      :response,
    )
  end
end
