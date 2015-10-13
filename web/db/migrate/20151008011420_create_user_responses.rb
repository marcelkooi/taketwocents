class CreateUserResponses < ActiveRecord::Migration
  def change
    create_table :user_responses do |t|
    	t.integer :entry_id, :user_id
    	t.boolean :response
    	t.integer :response_time
      t.timestamps
    end
  end
end
