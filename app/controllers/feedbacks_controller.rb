class FeedbacksController < ApplicationController
	before_action :logged_in?, only: [:new, :create]

	def new
		@feedback = Feedback.new

	end

	def create
		@feedback = Feedback.new(feedback_params)
		@feedback.user_id = current_user.id

		if @feedback.save
			session[:user_id] = nil
			redirect_to thankyou_path
		else
			render :new
			flash.now[:danger] = "Feedback not captured successfully."
		end

	end


	private
	def feedback_params
		params.require(:feedback).permit(:prompt_help, :would_use, :user_id)
	end

end