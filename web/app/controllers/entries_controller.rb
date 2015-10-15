class EntriesController < ApplicationController

	def show
		@entry = Entry.find(params[:id])
		@entry_show_time = Time.now
	end

	def create
		@stack = Stack.find(params[:stack_id])
		@entry = @stack.entry.create(entry_params)

		if @entry.save
			redirect_to entries_path
		else
			redirect_to stack_path
		end

	end

	def edit
		@entry = Entry.find(params[:id])
	end

	def update
		@entry = Entry.find(params[:id])

		if @entry.update(entry_params)
			redirect_to @entry
		else
			render 'edit'
		end
	end

	def vote
		@entry = Entry.find(params[:id])
		time = Time.now - params[:entry_show_time].to_datetime
		UserResponse.create(response: params[:response], entry: @entry, user: current_user, response_time: time )
		redirect_to entry_path(@entry.id + 1)
	end


	private
	  def entry_params
	    params.require(:entry).permit(:title, :question, :image)
	  end

end