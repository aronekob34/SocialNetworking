class MainController < ApplicationController
	layout 'main'

	def welcome
		#binding.pry
		if user_signed_in?
        	redirect_to edit_user_registration_path(current_user)
    	else
			render 'welcome'
    	end     
	end

	def privacy
	end
end
