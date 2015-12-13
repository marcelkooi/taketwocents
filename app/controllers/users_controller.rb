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
		@stacks = Stack.all

		if params[:stack_id].present?
			if @user.save
				testing_stack = Stack.find(params[:stack_id])
				session[:user_id] = @user.id
				redirect_to show_card_path(testing_stack.id, 1)
			else
				flash.now[:danger] = "User not saved successfully."
				render :new
			end
		else
			flash.now[:danger] = "User not saved successfully."
			render :new
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
			render :new
		end

		if @user.update_attributes(user_params) && params[:stack_id].present?
			testing_stack = Stack.find(params[:stack_id])
			session[:user_id] = @user.id
			redirect_to show_card_path(testing_stack.id, 1)
		else
			render :edit
		end
	end

	private
		def user_params
			params.require(:user).permit(:age, :gender, :group, :stack)
		end

end