class ProjectsController < ApplicationController
  before_action :get_project, only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.all
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project was successfully created."
      redirect_to @project
    else
      render 'new'
    end
  end

  def new
    @project = Project.new()
  end

  def edit
  end

  def show
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Project was successfully created."
      redirect_to @project
    else
      render 'new'
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "'#{@project.title}' was deleted."
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end

  def get_project
    @project = Project.find(params[:id])
  end
end
