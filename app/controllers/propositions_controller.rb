class PropositionsController < ApplicationController

  def index
    @proposition = Proposition.where(user_id: current_user.id).order("created_at DESC")
  end

  def show
    @proposition = Proposition.find(params[:id])
  end

  def new
    @proposition = Proposition.new
    @propositions = Proposition.where(user_id: current_user.id).order("created_at DESC")
  end

  def create
    @proposition = Proposition.new(proposition_params)
    if @proposition.save
      redirect_to propositions_path
    else
      render 'new'
    end
  end

  def edit
    @proposition = Proposition.find(params[:id])
  end

  def update
    @proposition = Proposition.find(params[:id])
    if @proposition.update(proposition_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    proposition = Proposition.find(params[:id])
    if proposition.user_id == current_user.id
      proposition.destroy
    end
  end

  def list
    @propositions = Proposition.where(user_id: current_user.id)
  end

  private

  def proposition_params
    params.require(:proposition).permit(:name, :description).merge(user_id: current_user.id)
  end


end
