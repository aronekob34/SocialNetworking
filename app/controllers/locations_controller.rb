class LocationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @locations = current_user.host.locations
    @projects = current_user.host.projects
  end

  def new
    #binding.pry
  	@location = Location.new
    #@location_images = @location.location_images.build
  end

  def create
  	@location = Location.new(input_params)
    #binding.pry
  	if @location.save && current_user.host.locations << @location
        if params[:location_images] != nil && params[:location_images][:houseimages].to_a.size < 11
          params[:location_images]['houseimages'].each do |a|
            @location_images = @location.location_images.create!(:houseimages => a)
          end      
        else
          if params[:location_images] != nil && params[:location_images][:houseimages].to_a.size > 10
            flash[:alert] = "An error has occurred, do not upload more then 10 Images per Location"
            redirect_to action: "index"
          end
    	  end  		
      flash[:notice] = "Location sucessfully Updated"
      redirect_to action: "index"
    else
      flash[:alert] = "An error has occurred during the saving"
      render "new"
    end     
  end

  def edit
  	@location = Location.find(params[:id])
    @location_images = @location.location_images.build
  end

  def update
    @location = Location.find(params[:id])
  	if @location.update_attributes(input_params) && current_user.host.locations.find(@location.id).update_attributes(input_params)
      if params[:location_image].present?
        params[:location_images]['houseimages'].each do |a|
            @location_images = @location.location_images.create!(:houseimages => a)
        end    
      end
      flash[:notice] = "Location sucessfully Updated"
      redirect_to action: "index"
    else
      flash[:alert] = "An error has occurred during the update"
      render "update"
    end      
  end

  def show 
  	@location = Location.find(params[:id])
    @location_images = @location.location_images.all
  end

  def delete
    @location = Location.find(params[:id])
  end

  def destroy
    @location = Location.find(params[:id])
    if @location.destroy
      flash[:notice] = "Location deleted successfully"
      redirect_to action: "index"
    else 
      flash[:alert] = "Location was not deleted, please try again"
      render("delete")
    end
  end

  private
  def input_params
  	params.require(:location).permit(:description, :location, :singleroom, :surfspot, :barbecue, :villa, :swimmingpool, :skiresort, :country, :state, location_images_attributes: [:id, :location_id, :houseimages])
  end
end 