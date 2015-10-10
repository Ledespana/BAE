class InteractionsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @interactions = @user.interactions
  end

  def new
    @user = User.find(params[:user_id])
    if current_user
      @interaction = Interaction.new
    else
      flash[:errors] = "You have no permission to do that!"
      redirect_to user_interactions_path(@user)
    end
  end

  def create
    @user = User.find(params[:user_id])
    if current_user
      @interaction = @user.interactions.new(interaction_params)
      if @interaction.save
        flash[:notice] = "Interaction created!"
        redirect_to :back
      else
        flash[:errors] = "Something went wrong!"
        redirect_to :back
      end
    else
      flash[:errors] = "You have no permission to do that!"
      redirect_to user_interactions_path(@user)
    end
  end

  def edit
    @user = User.find(params[:user_id])
    if current_user == User.find(params[:user_id])
      @interaction = Interaction.find(params[:id])
    elsif !signed_in?
      authenticate_user!
    else
      @interaction = Interaction.find(params[:id])
      flash[:notice] = "You have no permission to edit this vocabulary"
      redirect_to user_interactions_path(@user)
    end
  end

  def update
    @interaction = Interaction.find(params[:id])
    if current_user == User.find(params[:user_id])
      if @interaction.update_attributes(interaction_params)
        flash[:success] = "Interaction edited successfully!"
        redirect_to user_interactions_path(current_user)
      else
        flash[:alert] = "Something went wrong"
        redirect_to edit_user_interaction_path(current_user, @interaction)
      end
    else
      flash[:error] = "You have no permission to edit this interaction"
      redirect_to user_interactions_path(current_user)
    end
  end

  def destroy
    @user = current_user
    @interaction = Interaction.find(params[:id])
    if current_user
      @interaction.destroy
      flash[:notice] = "Interaction deleted successfully"
      redirect_to user_interactions_path(@user)
    else
      flash[:error] = "You have no permission to modify this vocabulary"
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
      :user_id
    )
  end
end
