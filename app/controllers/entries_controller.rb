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
			redirect_to @stack
		elsif @picture.save
			redirect_to :back
		else
			redirect_to root_path
		end
	end

	def edit
	end

	def update
		if @entry.update(entry_params)
			redirect_to @entry
		else
			redirect_to root_path
		end
	end

	# def vote
	# 	@stack = Stack.find(params[:stack_id])
	# 	@entry = @stack.entries.find(params[:id])
	# 	time = Time.now - params[:entry_show_time].to_datetime
	# 	UserResponse.create(entry: @entry, user: current_user, response: params[:response], response_time: time )
		
	# 	if Entry.exists? id: @entry.id + 1
	# 		redirect_to stack_entry_path(@stack, @entry.id + 1)
	# 	else
	# 		session[:user_id] = nil
	# 		redirect_to thankyou_path
	# 	end
	# end


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