class AuthsController < ApplicationController
	before_action :authenticate_user
	def authenticate_user
		unless User.find_by(id: session[:user_id])
			redirect_to '/'
		end

	end
end
