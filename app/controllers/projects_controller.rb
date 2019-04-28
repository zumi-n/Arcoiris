class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @proposition = @project.proposition
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
    @project = Project.find(params[:id])
    @proposition = @project.proposition
  end

  def update
    @project = Project.find(params[:id])
    @proposition = @project.proposition
    if @project.update(project_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @proposition = @project.proposition
    if @proposition.user_id == current_user.id
      @project.destroy
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :content, :phase, :proposition_id).merge(proposition_id: params[:proposition_id], user_id: current_user.id)
  end
end
