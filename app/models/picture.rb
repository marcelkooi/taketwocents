class Picture < ActiveRecord::Base

	has_many :entries
	mount_uploader :link, PictureUploader

	validates :link, presence: true

end