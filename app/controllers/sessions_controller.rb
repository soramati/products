class SessionsController < ApplicationController
  def new

  end
  def login
	administrator =User.find_by(admin: true)
  	if administrator.name == params[:session][:user_name].to_i
  		session[:user_name] = params[:session][:user_name]
  		redirect_to "/admins"
  	else
  		redirect_to "/administrator/login"
  	end

  end
end
