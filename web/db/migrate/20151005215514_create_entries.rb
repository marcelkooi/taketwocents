class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
    	t.string :title
    	t.integer :question_id, :image_id
    	t.timestamps
    end
  end
end
