class Stack < ActiveRecord::Base
	
	has_many :cards
	has_many :entries, through: :cards

	validates :title, presence: true


end