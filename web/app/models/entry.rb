class Entry < ActiveRecord::Base
	
	has_many :user_responses
	belongs_to :stack

	validates :question, presence: true

	mount_uploader :image, PictureUploader

end