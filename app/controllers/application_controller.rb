class ApplicationController < ActionController::Base
	helper_method :current_user
	helper_method :get_current_user
    before_action :login_required

	private

	def login_required
      unless current_user
        redirect_to "/welcome"
      end
    end
    def get_current_user
    	if session[:user_name]
			@current_user = User.find_by(name: session[:user_name])
		end		
    end
	def current_user
		if session[:user_name]
			return true
		else
			return false
		end
	end
end
