class EntriesController < ApplicationController
	before_action :authenticate_user!

	def index
		@entries = Entry.all
	end

	def show
		@entry = Entry.find(params[:id])
		@image = @entry.image_id
	end

	def new
		@entry = Entry.new
	end

	def create
		@image = Image.find(params[:entry][:image_id])
		@question = Question.find(params[:entry][:question_id])
		@entry = Entry.new(entry_params)

		@entry.save
		redirect_to entries_path
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
		response = UserResponse.create(response: params[:response], entry: @entry, user: current_user )
		redirect_to entry_path(@entry.id + 1)
	end


	private
	  def entry_params
	    params.require(:entry).permit(:title, :question_id, :image_id)
	  end

end