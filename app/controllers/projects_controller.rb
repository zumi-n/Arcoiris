class ProjectsController < ApplicationController

  def index
    @project = Project.where(user_id: current_user.id).order("created_at ASC")
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
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
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    project = Project.find(params[:id])
    if project.user_id == current_user.id
      project.destroy
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :content, :phase).merge(user_id: current_user.id)
  end
end
