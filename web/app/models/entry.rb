class Entry < ActiveRecord::Base
	
	has_many :user_responses
	belongs_to :stack
	belongs_to :picture

	validates :question, presence: true

end