class UsersController < ApplicationController
	skip_before_action :login_required
	def create
		user = User.new(name: get_user_name)
		user.save!
		session[:user_name] = user.name
		redirect_to "/"
	end

	def destory
		reset_session
		redirect_to "/"
	end

	def get_user_name
		user = User.all
		count = 0
		while count < 100
			
			a = []
			10.times do
				a.push(rand(9))
			end

			password = a.join
					
			user.each do |user|
				if user.name != password
					return(password)
				end
			end
			count +=1
		end
	end
end
