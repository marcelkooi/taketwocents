class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
    	t.string :title
    	t.string :code
    	t.timestamps
    end
  end
end
