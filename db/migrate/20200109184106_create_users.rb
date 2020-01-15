class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.string "firstname", :limit => 50
      t.string "lastname", :limit => 50
      t.string "email", :default => '', :null => false
      t.string "password", :limit => 40
      t.timestamps
    end
  end
  def down 

  	drop_table :users
  end
end
