class EntriesController < ApplicationController

	def show
		@stack = Stack.find(params[:stack_id])
		@entry = @stack.entries.find(params[:id])
		@entry_show_time = Time.now
	end

	def create
		@stack = Stack.find(params[:stack_id])
		@entry = @stack.entries.create(entry_params)

		if @entry.save
			redirect_to @stack
		else
			redirect_to root_path
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
		@stack = Stack.find(params[:stack_id])
		@entry = @stack.entries.find(params[:id])
		time = Time.now - params[:entry_show_time].to_datetime
		UserResponse.create(entry: @entry, user: current_user, response: params[:response], response_time: time )
		if Entry.exists? id: @entry.id + 1
			redirect_to stack_entry_path(@stack, @entry.id + 1)
		else
			session[:user_id] = nil
			redirect_to root_path
		end
	end


	private
	  def entry_params
	    params.require(:entry).permit(:title, :question, :image)
	  end

end