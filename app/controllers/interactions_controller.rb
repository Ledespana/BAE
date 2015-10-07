class InteractionsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @sentences = @user.interactions.where(
      category: "Sentence"
    ).order("Sentence")
    @keywords = @user.interactions.where(category: "Keyword").order("Keyword1")
    @combo = @user.interactions.where(category: "Combo").order("Keyword1")
  end

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
