class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
    	t.integer :sequence
    	t.integer :stack_id
    	t.integer :entry_id

      t.timestamps null: false
    end
  end
end
