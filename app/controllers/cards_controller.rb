class CardsController < ApplicationController

	def show
		@stackid = params[:stack_id]
		@seq = params[:sequence]
		@card = Card.where("stack_id = ? AND sequence = ?", @stackid, @seq).first
		@entryid = @card.entry_id
		@entry = Entry.find(@entryid)
		@card_show_time = Time.now
	end

	def create
		@card = Card.new(card_params)
		@stackid = @card.stack_id

		if @card.save
			redirect_to stack_path(@stackid)
		else
			redirect_to :back
		end
	end

	def vote
		@stackid = params[:stack_id]
		@seq = params[:sequence]
		@nextseq = (@seq.to_i + 1).to_s
		@card = Card.where("stack_id = ? AND sequence = ?", @stackid, @seq).first
		@entryid = @card.entry_id
		@entry = Entry.find(@entryid)
		time = Time.now - params[:card_show_time].to_datetime
		UserResponse.create(entry: @entry, user: current_user, response: params[:response], response_time: time )
		

		if Card.where("stack_id = ? AND sequence = ?", @stackid, @nextseq).exists?
			redirect_to show_card_path(@stackid, @nextseq)
		else
			session[:user_id] = nil
			redirect_to thankyou_path
		end
	end

	private
		def card_params
			params.require(:card).permit(:stack_id, :entry_id, :sequence)
		end



end