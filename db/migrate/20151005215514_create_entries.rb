class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
    	t.integer :stack_id
    	t.string :title
    	t.string :question
    	t.string :image
    	t.timestamps
    end
  end
end
