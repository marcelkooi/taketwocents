class RemoveStackFromEntry < ActiveRecord::Migration
  def change
  	remove_column :entries, :stack_id, :integer
  end
end
