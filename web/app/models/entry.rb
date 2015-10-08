class Entry < ActiveRecord::Base
	has_many :images
	has_many :questions


end