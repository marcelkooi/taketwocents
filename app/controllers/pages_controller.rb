class PagesController < ApplicationController
before_action :admin_user, only: :admin

	def home
	end

	def about
	end

	def admin
		@user_responses = UserResponse.all
		@users = User.all
		@entries = Entry.all
		@stacks = Stack.all

		respond_to do |format|
			format.html
			format.csv { send_data @user_responses.to_csv, filename: "user-responses-#{Date.today}.csv" }
		end

	end

	def thankyou
	end

end