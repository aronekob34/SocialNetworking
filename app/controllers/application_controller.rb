class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
    #before_action :authenticate_user!
  	#protect_from_forgery with: :exception
  	protect_from_forgery prepend: false

    layout "user"

  	protected 

  	def after_sign_in_path_for(resource)
      if current_user.roles_id == 1 && current_user.developer.present?
        developers_path
      elsif current_user.roles_id == 1 && current_user.developer.nil?
        new_developer_path
      elsif current_user.roles_id == 2 && current_user.host.present?        
        hosts_path
      else 
        new_host_path
      end
	  end

    def after_sign_out_path_for(resource)
      root_path
    end

  	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :country, :location, :roles_id, :email, :email_confirmation, :password_confirmation, :avatar]) #:password, 
  		devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :country, :location, :roles_id, :email, :email_confirmation, :password_confirmation, :avatar]) #:password, 
	end  		
end
