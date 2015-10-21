class ChangeImageColumnForEntries < ActiveRecord::Migration
	def change
		remove_column :entries, :image, :string
		add_column :entries, :picture_id, :integer
	end
end
