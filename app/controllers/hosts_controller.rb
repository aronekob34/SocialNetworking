class HostsController < ApplicationController
  before_action :authenticate_user!

  def index 
   #controllare che l'host abbia degli ads con delle skill
    if current_user.host != nil && current_user.host.skills != nil
      host_skills = current_user.host.skills.pluck(:name) 
      @developers = Developer.tagged_with(host_skills, any: :true)
    else
      @developers = Developer.all
    end
    @developers = Developer.all
    @developer = Developer.new
  end

  def index_update    
    dev_skills = param_clean(developer_skills)
    dev_interests = param_clean(developer_interests)
    if (dev_skills.empty? == false) && (dev_interests.empty? == false) 
      @developers = Developer.tagged_with(dev_interests[:interest_list], any: :true)    
      @developers = @developers.tagged_with(dev_skills[:skill_list], any: :true) 
      @developers = @developers.where(param_clean(search_params))   
    elsif dev_skills.empty? == false
      #binding.pry
      @developers = Developer.tagged_with(dev_skills[:skill_list], any: :true)
      @developers = @developers.where(param_clean(search_params))   
    elsif dev_interests.empty? == false
      @developers = Developer.tagged_with(dev_interests[:interest_list], any: :true)    
      @developers = @developers.where(param_clean(search_params))   
    else
      @developers = Developer.where(param_clean(search_params))
    end
    #binding.pry  
    @developer = Developer.new    
  end

  def new
  	if current_user.host == nil
  		@host = Host.new
  	else
  		redirect_to action: "edit"
  	end
  end

  def create 
  	@host = Host.new(input_params)
  	if @host.save && current_user.host = @host
  		flash[:notice] = "Profile sucessfully Saved"
  		redirect_to action: "index"#, id: @host.id
  	else
  		flash[:alert] = "An error has occurred during the saving"
  		render "new"
  	end
  end

  def edit
  	@host = Host.find(params[:id])
  end

  def update
    @host = Host.find(params[:id])
    if @host.update_attributes(input_params)
    	flash[:notice] = "Profile sucessfully Edited"
    	redirect_to action: "index"
    else
    	flash[:alert] = "An error has occurred during the saving"
    	render "edit"
    end
  end

  def show
  	@host = Host.find(params[:id])
  end

  private

  def input_params
  	params.require(:host).permit(:description, :location, :singleroom, :sharedroom, :surfspot, :barbecue, :villa, :swimmingpool, :skiresort, :interest_list, :skill_list, :jobtitle_id)
  end

  def search_params
    params.require(:developer).permit(:jobtitle_id, :experience)
  end
  
  def developer_skills
    params.require(:developer).permit(:skill_list)
  end

  def developer_interests
    params.require(:developer).permit(:interest_list)
  end

  def param_clean(_params)
    _params.delete_if do |k, v|
      v.empty? || v == "0" || v == 0
    end
  end 
end


    # Make the queries if those parameters are filled
=begin    
    if new_params.empty? && ads_params.empty? && skill_params[:ads_attributes][:skill_list].empty?
      redirect_to action: "index"
    elsif new_params.empty? && ads_params.empty?
      binding.pry
      @locations = Location.all 
    elsif ads_params.empty?
      @locations = Location.joins(:ads).where(locations: new_params).includes(:ads)
    elsif new_params.empty?
      @locations = Location.joins(:ads).where(ads: ads_params).includes(:ads)     
    else # All parameter are present
      @locations = Location.joins(:ads).where(locations: new_params, ads: ads_params).includes(:ads)
    end
=end    
