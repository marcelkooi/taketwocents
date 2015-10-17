class UserResponse < ActiveRecord::Base

	belongs_to :entry
	belongs_to :user

	validates_uniqueness_of :user, scope: :entry

	validates :user, presence: true
	validates :entry, presence: true
	validates :response, inclusion: { in: [true, false] }
	validates :response, exclusion: { in: [nil] }

end