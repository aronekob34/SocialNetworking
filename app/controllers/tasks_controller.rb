class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    if project_params["format"] != nil
      @project = Project.find(project_params["format"].to_i)
    end
  end

  def create 
    @task = Task.new(input_params)
    @project = Project.find(@task.project_id) if @task.project_id != nil
    if @task.save && @project.tasks << @task
      flash[:notice] = "Task sucessfully Saved"
      redirect_to controller: "projects", action: "show", id: @task.project_id
    else
      flash[:alert] = "An error has occurred during the saving"
      render "new"
    end
  end

  def edit
    @task = Task.find(params[:id])
    @project = Project.find(@task.project_id)
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(input_params) #&& current_user.host.tasks.find(@task.id).update
      flash[:notice] = "Task sucessfully Updated"
      redirect_to controller: "projects", action: "show", id: @task.project_id
    else
      flash[:alert] = "An error has occurred during the saving"
      render "edit"
    end      
  end

  def show
    @task = Task.find(params[:id])
    @ad = @task.ad
  end

  def delete 
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = "Task sucessfully Deleted"
      redirect_to controller: "projects", action: "show", id: @task.project_id
    else
      flash[:alert] = "An error has occurred during the Deletion"
      render "delete"
    end            
  end

  private
  def input_params
    params.require(:task).permit(:name, :project_id, :description, :completed, :skill_list, :days)
  end

  def project_params
    params.permit(:format)
  end
end