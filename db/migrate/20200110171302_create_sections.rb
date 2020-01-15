class CreateSections < ActiveRecord::Migration[5.1]
  def up
    create_table :sections do |t|
      t.integer "page_id"
      t.string "name"
      t.integer "position"
      t.boolean "visible", :default => true
      t.string "content_type"
      t.string "content" 
      t.timestamps
    end
    add_index("sections", "page_id")
    add_index("sections", "content_type")
  end
end
