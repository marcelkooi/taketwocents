class LoginsController < ApplicationController

	def new
	end

	def create
		@user = User.find(params[:id])
		if user.admin? && user.authenticate(params[:password])
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