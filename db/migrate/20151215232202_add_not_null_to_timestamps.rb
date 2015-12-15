class AddNotNullToTimestamps < ActiveRecord::Migration
  def change
  	change_column :entries, :created_at, :datetime, :null => false
  	change_column :stacks, :created_at, :datetime, :null => false
  	change_column :user_responses, :created_at, :datetime, :null => false
  	change_column :entries, :created_at, :datetime, :null => false
  	add_column :users, :created_at, :datetime, :null => false, default: Time.now
  end
end
