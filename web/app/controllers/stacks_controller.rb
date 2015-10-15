class StacksController < ApplicationController

	def new
		@stack = Stack.new
	end

	def create
		@stack = Stack.new(stack_params)

		if @stack.save
			redirect_to edit_stack_path
		else
			redirect_to root_path
		end
	end

	def edit 
		@stack = Stack.find(params[:id])
	end

	def update
		@stack = Stack.find(params[:id])

		@

		if @stack.update(stack_params)
			redirect_to edit_stack_path
		else
			redirect_to root_path
		end
	end


	private
		def stack_params
			params.require(:stack).permit(:title, :code)
		end

end