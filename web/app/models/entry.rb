class Entry < ActiveRecord::Base
	belongs_to :image
	belongs_to :question
	has_many :user_responses

end