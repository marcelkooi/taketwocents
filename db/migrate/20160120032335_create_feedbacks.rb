class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
    	t.integer :prompt_help
    	t.integer :would_use
    	t.integer :user_id

      t.timestamps null: false
    end
  end
end
