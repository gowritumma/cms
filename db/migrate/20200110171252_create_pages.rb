class CreatePages < ActiveRecord::Migration[5.1]
  def up
    create_table :pages do |t|
      t.integer "subject_id"
      t.string "name", :limit => 200, :null => false
      t.string "permalink" 
      t.boolean "visible"
      t.timestamps
    end
    add_index("pages", "subject_id")
    add_index("pages", "permalink")
  end

  def down
  	drop_table :pages
  end
end
