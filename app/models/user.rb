class User < ActiveRecord::Base

  has_many :user_responses, dependent: :destroy

end
