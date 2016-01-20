class User < ActiveRecord::Base

  has_many :user_responses, dependent: :destroy
  has_one :feedback, dependent: :destroy

  validates :gender, presence: true
  validates :age, presence: true
  validates :group, presence: true

end
