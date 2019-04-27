class PropositionsController < ApplicationController

  def index
    @proposition = Proposition.where(user_id: current_user.id).order("created_at ASC")
    @project = Project.where(user_id: current_user.id).order("created_at ASC")

  end

  def new
    @proposition = Proposition.new
  end

  def create
    @proposition = Proposition.new(proposition_params)
    if @proposition.save
      redirect_to propositions_path
    else
      render 'new'
    end
  end

  private

  def proposition_params
    params.require(:proposition).permit(:name, :description).merge(user_id: current_user.id)
  end


end
