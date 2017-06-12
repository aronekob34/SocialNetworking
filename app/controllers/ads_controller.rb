class AdsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @ad = Ad.new
    #binding.pry
    if project_params["format"] != nil
      @project = Project.find(project_params["format"].to_i)
    end
  end

  def create
    @ad = Ad.new(input_params)
    @location = Location.find(@ad.location_id) if @ad.location_id
    @project = Project.find(@ad.project_id) if @ad.project_id
    @task = Task.find(@ad.task_id) if @ad.task_id
    if @ad.save && @location.ads << @ad && @project.ads << @ad && @task.ad = @ad
      flash[:notice] = "Ad sucessfully Saved"
      redirect_to controller: "projects", action: "show", id: @ad.project_id
    else
      flash[:alert] = "An error has occurred during the saving"
      render "new"
    end     
  end
  def edit
    @ad = Ad.find(params[:id])
    @project = Project.find(@ad.project_id)
  end

  def update
    @ad = Ad.find(params[:id])
    if @ad.update_attributes(input_params) #&& current_user.host.locations.find(@ad.location_id).update_attributes(input_params)
      flash[:notice] = "Ad sucessfully Updated"
      redirect_to controller: "projects", action: "show", id: @ad.project_id
    else
      flash[:alert] = "An error has occurred during the update"
      render "new"
    end      
  end

  def show 
    @ad = Ad.find(params[:id])
    #@images = @ad.houseimages
  end

  def delete
    @ad = Ad.find(params[:id])
  end

  def destroy
    @ad = Ad.find(params[:id])
    if @ad.destroy
      flash[:notice] = "Ad deleted successfully"
      redirect_to controller: "projects", action: "show", id: @task.project_id
    else 
      flash[:alert] = "Ad was not deleted, please try again"
      render("delete")
    end
  end

  private
  def input_params
    params.require(:ad).permit(:project_id, :location_id, :task_id, :title, :description, :budget, :days, :remote, :skill_list)
  end

  def project_params
    params.permit(:format)
  end  
end
