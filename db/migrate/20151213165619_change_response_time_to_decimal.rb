class ChangeResponseTimeToDecimal < ActiveRecord::Migration
  def change
  	remove_column :user_responses, :response_time, :integer
		add_column :user_responses, :response_time, :decimal, precision: 5, scale: 2
  end
end
