class EntriesController < ApplicationController
	before_action :admin_user, only: [:create, :edit, :update, :new]
	before_action :current_user, only: [:show, :vote]
	before_action :set_entry, only: [:show, :edit, :update]
	respond_to :js

	def new
		@entry = Entry.new
		@picture = Picture.new
	end

	def show

	end

	def create
		@entry = Entry.new(entry_params)
		@picture = Picture.new(picture_params)


		if @entry.save
			redirect_to admin_path
			flash[:success] = "Entry saved successfully!"
		elsif @picture.save
			redirect_to :back
		else
			render :new
			flash.now[:danger] = "Entry not saved successfully."
		end
	end

	def edit
	end

	def update
		if @entry.update_attributes(entry_params)
			redirect_to @entry
		else
			render :edit
		end
	end

	private
	  def entry_params
	    params.require(:entry).permit(:title, :question, :picture_id)
	  end

	  def picture_params
	  	params.fetch(:picture, {}).permit(:link)
	  end

	  def set_entry
	  	@entry = Entry.find(params[:id])
	  end

end