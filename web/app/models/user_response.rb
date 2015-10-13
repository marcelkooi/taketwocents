class UserResponse < ActiveRecord::Base

	belongs_to :entry
	belongs_to :user

	validates_uniqueness_of :user, scope: :entry

end