class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions, :force => true do |t|
      t.string :name, null:false, limit: 50
      t.timestamps null: false
    end
    add_index :regions, :name, :unique => true, :name => :idx_regions_on_name
    execute "INSERT INTO regions (name,created_at, updated_at) values ('EU',now(), now()), ('US',now(), now())"
  end

  def self.down
    drop_table :regions
  end
end
