class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles, :force => true do |t|
      t.string :name, null:false, limit: 50
      t.timestamps null: false
    end
    add_index :roles, :name, :unique => true, :name => :idx_roles_on_name
    execute "INSERT INTO roles (name,created_at, updated_at) values ('Admin',now(), now()), ('Manager',now(), now()), ('User',now(), now()), ('Temp',now(), now())"
  end

  def self.down
    drop_table :roles
  end
end
