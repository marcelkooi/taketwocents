class StacksController < ApplicationController
	before_action :admin_user, only: [:new, :create, :edit, :update]
	before_action :current_user, only: [:show]

	def index
		@stacks = Stack.all
	end

	def new
		@stack = Stack.new
	end

	def show
		@stack = Stack.find(params[:id])
		@entry = Entry.new
	end

	def create
		@stack = Stack.new(stack_params)

		if @stack.save
			redirect_to @stack
		else
			redirect_to root_path
		end
	end

	def edit 
		@stack = Stack.find(params[:id])
	end

	def update
		@stack = Stack.find(params[:id])

		if @stack.update(stack_params)
			redirect_to stack_path
		else
			redirect_to root_path
		end
	end

	private
		def stack_params
			params.require(:stack).permit(:title, :code)
		end

end