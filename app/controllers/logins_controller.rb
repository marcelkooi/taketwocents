class LoginsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_username(params[:username])
		if user && user.admin? && user.password == params[:password]
			session[:user_id] = user.id
			redirect_to admin_path
		else
			redirect_to root_path
		end

	end


	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end


end