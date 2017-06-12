class LocationImagesController < ApplicationController
  before_action :authenticate_user!  
  before_action :set_location_image, only: [:show, :edit, :update, :destroy]

  # GET /location_images
  # GET /location_images.json
  def index
    @location_images = LocationImage.all
  end

  # GET /location_images/1
  # GET /location_images/1.json
  def show
    @location_image = LocationImage.find(params[:id])
    @location = Location.find(@location_image.location_id)
    @location_first = @location.location_images.first
    @location_last = @location.location_images.last
  end

  # GET /location_images/new
  def new
    @location_image = LocationImage.new
  end

  # GET /location_images/1/edit
  def edit
  end

  # POST /location_images
  # POST /location_images.json
  def create
    @location_image = LocationImage.new(location_image_params)

    respond_to do |format|
      if @location_image.save
        format.html { redirect_to @location_image, notice: 'Location image was successfully created.' }
        format.json { render :show, status: :created, location: @location_image }
      else
        format.html { render :new }
        format.json { render json: @location_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_images/1
  # PATCH/PUT /location_images/1.json
  def update
    respond_to do |format|
      if @location_image.update(location_image_params)
        format.html { redirect_to location_path(@location_image.location.id), notice: 'Location image was successfully updated.' }
        format.json { render :show, status: :ok, location: @location_image }
      else
        format.html { render :edit }
        format.json { render json: @location_image.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @location_image = LocationImage.find(params[:id])
  end
  # DELETE /location_images/1
  # DELETE /location_images/1.json
  def destroy
    @location_image.destroy
    respond_to do |format|
      format.html { redirect_to location_path(@location_image.location.id), notice: 'Location image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_image
      @location_image = LocationImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_image_params
      params.require(:location_image).permit(:location_id, :houseimages)
    end
end
