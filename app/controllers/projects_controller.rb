class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def new
  	@project = Project.new
  end

  def create 
  	@project = Project.new(input_params)
  	if @project.save && current_user.host.projects << @project
		flash[:notice] = "Project sucessfully Saved"
		redirect_to controller: "locations", action: "index"
	else
		flash[:alert] = "An error has occurred during the saving"
		render "new"
	end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(input_params) #&& current_user.host.projects.find(@project.id).update
      flash[:notice] = "Profile sucessfully Updated"
      redirect_to controller: "locations", action: "index"
    else
      flash[:alert] = "An error has occurred during the saving"
      render "edit"
    end      
  end

  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks
    @ads = @project.ads
  end

  def delete 
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:notice] = "Profile sucessfully Deleted"
      redirect_to controller: "locations", action: "index"
    else
      flash[:alert] = "An error has occurred during the Deletion"
      render "delete"
    end            
  end

  private
  def input_params
  	params.require(:project).permit(:name, :description, :percentage_completion, :budget, :nemployees, :ninvestors, :hiring)
  end

end
