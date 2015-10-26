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
			session[:user_id] = @user.id
			redirect_to stack_entry_path(Stack.first.id, Stack.first.entries.first.id)
		else
			redirect_to root_path
		end
	end

	def edit
		if current_user
			@user = current_user
		else
			redirect_to root_path
		end
	end

	def update
		if current_user
			@user = current_user
		else
			redirect_to root_path
		end

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