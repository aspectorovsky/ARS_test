class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories, :force => true do |t|
      t.string :name, null:false, limit: 100
      t.timestamps null: false
    end
    add_index :categories, :name, :unique => true, :name => :idx_categories_on_name
    execute "INSERT INTO categories (name,created_at, updated_at) values ('Chairs',now(), now()), ('Tables',now(), now()), ('Monitors',now(), now())"
  end

  def self.down
    drop_table :categories
  end
end
