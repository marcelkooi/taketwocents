class StacksController < ApplicationController
	before_action :admin_user, only: [:new, :create, :edit, :update]
	before_action :current_user, only: [:show]
	before_action :set_stack, only: [:show, :edit, :update]

	def index
		@stacks = Stack.all
	end

	def new
		@stack = Stack.new
	end

	def show
		@cards = @stack.cards
		@cards = @cards.sort{ |a,b| a.sequence - b.sequence }
		if @cards.last
			@lastcard = @cards.last
			@nextseq = @lastcard.sequence + 1
		else
			@nextseq = 1
		end
		@entries = Entry.paginate(:page => params[:page], per_page: 6)
		@new_card = Card.new
	end

	def create
		@stack = Stack.new(stack_params)

		if @stack.save
			redirect_to @stack
		else
			render :new
			flash.now[:danger] = "Stack not saved successfully."
		end
	end

	def edit 

	end

	def update

		if @stack.update(stack_params)
			redirect_to stack_path
		else
			render :edit
		end
	end

	private
		def stack_params
			params.require(:stack).permit(:title, :code)
		end

		def set_stack
			@stack = Stack.find(params[:id])
		end

end