class Stack < ActiveRecord::Base
	
	has_many :user_responses, through: :entries
	has_many :entries


end