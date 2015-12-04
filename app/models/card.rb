class Card < ActiveRecord::Base

	belongs_to :stack
	belongs_to :entry

	validates :stack_id, presence: true
	validates :entry_id, presence: true
	validates :sequence, presence: true

	validates_uniqueness_of :sequence, scope: :stack

end