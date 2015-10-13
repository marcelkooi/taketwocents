class QuestionsController < ApplicationController

	def index
		@questions = Question.all
	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.new(question_params)

		if @question.save
			redirect_to questions_path
		else
			redirect_to root_path
		end

	end

		private
			def question_params
				params.require(:question).permit(:sentence)
			end

end