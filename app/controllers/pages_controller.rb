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
	end

	def thankyou
	end

end