class UsersController < ApplicationController

  def index
    @propositions = Proposition.where(user_id: current_user.id).order("created_at DESC")
    @projects = Project.where(user_id: current_user.id).order("created_at DESC")
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
