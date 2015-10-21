class Picture < ActiveRecord::Base

	has_many :entries
	mount_uploader :link, PictureUploader

end