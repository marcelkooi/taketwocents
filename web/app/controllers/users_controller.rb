class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to stack_entry_path(1, 1)
		else
			redirect_to root_path
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			redirect_to @user
		else
			redirect_to root_path
		end
	end

	private
		def user_params
			params.require(:user).permit(:username, :password, :ethnicity, :age, :gender)
		end

end