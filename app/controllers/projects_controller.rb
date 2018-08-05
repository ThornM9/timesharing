class ProjectsController < ApplicationController
  before_action :require_user
  before_action :set_project, only: [:show, :destroy, :update]
  
  def index
  end
  
  def create
    @project = Project.new(project_params)
    @project.users << current_user
      if @project.save
        redirect_to project_path(@project)
        flash[:success] = "Project was successfully created"
      else
        flash[:danger] = "There was an error creating the project"
      end
  end
  
  def update
  end
  
  def destroy
    @project.destroy
    flash[:notice] = "Project was successfully deleted"
    redirect_to user_path(current_user)
  end
  
  def new
    @project = Project.new
  end
  
  def show
  end
  
  private
  def set_project
    @project = Project.find(params[:id])
  end
  def set_user
    @user = User.find(params[:id])
  end
  
  def project_params
      params.require(:project).permit(:name, :description)
    end
end