class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
		@stacks = Stack.all
	end

	def create
		@user = User.new(user_params)

		if @user.save
			testing_stack = Stack.find_by(params[:stack_id])
			session[:user_id] = @user.id
			redirect_to show_card_path(testing_stack.id, 1)
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
			params.require(:user).permit(:ethnicity, :age, :gender, :stack)
		end

end