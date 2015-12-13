class Entry < ActiveRecord::Base
	
	has_many :cards
	has_many :stacks, through: :cards
	has_many :user_responses, dependent: :destroy
	belongs_to :picture

	validates :title, presence: true
	validates :question, presence: true
	validates :picture_id, presence: true

end