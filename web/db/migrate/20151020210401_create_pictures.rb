class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
    	t.string :link
    end
  end
end
