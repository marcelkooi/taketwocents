class UserResponse < ActiveRecord::Base

	belongs_to :entry
	belongs_to :user
	belongs_to :card

	validates_uniqueness_of :user, scope: :entry

	validates :user, presence: true
	validates :entry, presence: true
	validates :response, inclusion: { in: [true, false] }
	validates :response, exclusion: { in: [nil] }


	def self.to_csv
		attributes = %w[ 	id 
											card.stack.id 
											entry.id 
											entry.picture.id 
											user.id 
											user.age 
											user.gender 
											response 
											response_time ]

		CSV.generate(headers: true) do |csv|
			csv << attributes

			all.each do |user_response|
				csv << [	user_response.id,
									user_response.card.stack.id,
									user_response.entry.id,
									user_response.entry.picture.id,
									user_response.user.id,
									user_response.user.age, 
									user_response.user.gender,
									user_response.response,
									user_response.response_time	]
			end
		end
	end


end