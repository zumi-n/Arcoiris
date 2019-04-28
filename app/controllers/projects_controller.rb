class ProjectsController < ApplicationController

  def index
    @proposition = Proposition.where(user_id: current_user.id).order("created_at ASC")
    @project = Project.where(user_id: current_user.id).order("created_at ASC")
  end

  def show
    @proposition = Proposition.find(params[:proposition_id])
    @project = Project.find(params[:id])

  end

  def new
    @proposition = Proposition.find(params[:proposition_id])
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @proposition = Proposition.find(params[:proposition_id])
    @project = Project.find(params[:id])
  end

  def update
    @proposition = Proposition.find(params[:proposition_id])
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:title, :content, :phase, :proposition_id).merge(proposition_id: params[:proposition_id], user_id: current_user.id)
  end
end
