class AddCardIdToUserResponse < ActiveRecord::Migration
  def change
  	add_column :user_responses, :card_id, :integer
  end
end
