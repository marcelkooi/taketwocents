class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.boolean :admin
      t.string :gender
      t.integer :age
      t.string :ethnicity
    end
  end
end
