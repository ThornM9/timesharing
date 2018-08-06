class ProjectsController < ApplicationController
  before_action :require_user
  before_action :set_project, only: [:show, :update]
  
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
  
  def add_user
    @user = User.find(params[:friend_id])
    @project = Project.find(params[:project_id])
    @project.users << @user
    if @project.save
      flash[:success] = "User was successfully added"
    else
      flash[:danger] = "There was something wrong with this request"
    end
    redirect_to project_path(@project)
  end
  
  def destroy
    @project = Project.find(params[:project_id])
    @membership = @project.users.where(id: params[:friend_id]).first
    @project.users.destroy(@membership)
    flash[:notice] = "User was successfully removed"
    redirect_to project_path(@project)
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