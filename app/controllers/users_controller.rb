class UsersController < ApplicationController

  def index
    @propositions = Proposition.order("created_at DESC")
    @projects = Project.order("created_at DESC")
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
