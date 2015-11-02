class EditUserColumn < ActiveRecord::Migration
  def self.up
  	rename_column :users, :ethnicity, :group
  end

  def self.down
  end
end
