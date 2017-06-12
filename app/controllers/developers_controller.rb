class DevelopersController < ApplicationController
	before_action :authenticate_user!

	def index	
		if current_user.developer != nil && current_user.developer.skills != nil
			i = 0
			old_ad = "firstloop"
			@projects = []
			@ads = Ad.tagged_with(current_user.developer.skills, :any => true)
			@ads = @ads.order(location_id: :desc)
			@ads.each do |ad|
				if i > 0 && old_project_id == ad.project_id
					@projects << ad.project_id 
					i+=1
					old_project_id = ad.project_id
				end
			end
		else
			@ads = Ad.all
		end
		@location = Location.new
		@location.ads.build
		@project = Project.new
		@project.tasks.build
		@project.ads.build
	end

	def index_update
		@location = Location.new
		@location.ads.build
		new_params = param_clean(location_params).to_h
		ads_params = new_params.delete(:ads_attributes).to_h
		
		# Change in the ads parameters "1" into 1
		ads_params.each do |index, value|
            if value == "1"
            	ads_params[index] = 1 
            end
		end
		
		# Make the queries if those parameters are filled
		if new_params.empty? && ads_params.empty? && skill_params[:ads_attributes][:skill_list].empty?
			redirect_to action: "index"
		elsif new_params.empty? && ads_params.empty?
			@locations = Location.all	
		elsif ads_params.empty?
			@locations = Location.joins(:ads).where(locations: new_params).includes(:ads)
		elsif new_params.empty?
			@locations = Location.joins(:ads).where(ads: ads_params).includes(:ads)			
		else # All parameter are present
			@locations = Location.joins(:ads).where(locations: new_params, ads: ads_params).includes(:ads)
		end
		# Now if skills parameters are present, filter by skill
		if skill_params[:ads_attributes][:skill_list].present?
			@ads_with_tags = Ad.tagged_with(skill_params[:ads_attributes][:skill_list]) #ads
			locations_id = []
			ads_id = []
			old_location_id = "starting"
			@ads_with_tags.each do |ad|
				ads_id << ad.id
				if ad.location_id != old_location_id
				locations_id << ad.location_id
				end
				old_location_id = ad.location_id
			end
		    @locations = @locations.joins(:ads).where(ads: {id: ads_id}).includes(:ads)
		end
		@project = Project.new
		@project.tasks.build
		@project.ads.build			
	end

	def new
		if current_user.developer == nil 			
			@developer = Developer.new
		else 
			redirect_to action: "edit"
		end
	end

	def create
		@developer = Developer.new(input_params)
		if @developer.save && current_user.developer = @developer
			flash[:notice] = "Profile sucessfully Saved"
			redirect_to action: "index" #, id: @developer.id
		else
			flash[:alert] = "An error has occurred during the saving"
			render "new"
		end
	end

	def edit
		@developer = Developer.find(params[:id])
	end

	def update
		@developer = Developer.find(params[:id])
		if @developer.update_attributes(input_params) 
			flash[:notice] = "Profile sucessfully Saved"
		#	redirect_to action: "show", id: @developer.id
			redirect_to action: "index" #, id: @developer.id
		else
			flash[:alert] = "An error has occurred during the saving"
			render "new"
		end			
	end 


	def show 
		@developer = Developer.find(params[:id])
		@user = User.find(@developer.user_id)
		@jobtitle = Jobtitle.find(@developer.jobtitle_id)		
	end

	private

	def input_params
		params.require(:developer).permit(:experience, :interests, :jobtitle_id, :website_url, :tag_list, :skill_list, :interest_list, :description)
	end

	def location_params
		params.require(:location).permit(:country, :location, :surfspot, :barbecue, :villa, :swimmingpool, :skiresort, :singleroom, {:ads_attributes => [:remote, :days]})
	end

	def param_clean(_params)
	  _params.delete_if do |k, v|
	    if v.instance_of?(ActionController::Parameters)
	      param_clean(v)
	    end
	    v.empty? || v == "0" || v == 0
	  end
	end	
	def skill_params
		params.require(:location).permit({:ads_attributes => [:skill_list]})
	end
end
