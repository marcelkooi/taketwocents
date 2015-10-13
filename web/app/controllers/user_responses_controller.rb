class UserResponsesController < ApplicationController

	def index
		@user = current_user
		@entries = Entry.all
		@user_responses = @user.UserResponse.all
	end

	def show
		@entry = Entry.find(params[:user_reponse][:entry_id])
		@user_response = UserResponse.find(params[:id])
		@user = current_user
	end

	def edit
		@user_response = UserResponse.find(params[:id])
	end

	def update
		@entry = Entry.find(params[:user_reponse][:entry_id])
		@user_response = UserResponse.find(params[:id])

		if @user_response.update(user_response_params)
			redirect_to @entry
		else
			render 'edit'
		end
	end

	private
	  def user_response_params
	    params.require(:user_reponse).permit(:reponse, :entry_id, :user_id, :response_time)
	  end

end
