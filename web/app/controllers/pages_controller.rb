class PagesController < ApplicationController
before_action :admin_user, only :admin

	def home
	end

	def about
	end

	def admin

	end

	def thankyou
	end

	private
		def admin_user
			redirect_to root_path unless current_user.admin?
		end

end