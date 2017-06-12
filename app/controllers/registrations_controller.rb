class RegistrationsController < Devise::RegistrationsController
  	before_action :authenticate_user!	

protected

  # Overwrite update_resource to let users to update their user without giving their password
  def update_resource(resource, params)
    if current_user.provider == "facebook"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end


  def after_update_path_for(resource)
      flash[:notice] = "Account sucessfully updated"
      if current_user.roles_id == 1
        developers_path
      else
        hosts_path
      end
  end  

end
