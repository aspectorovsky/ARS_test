class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, :force => true do |t|
      t.references :role, index: {name:"idx_users_on_role_id"}, null:false
      t.references :company, index: {name:"idx_users_on_company_id"}
      t.string :email, limit: 100, null:false
      t.string :password, limit: 50, null:false
      t.text :contact_info
      t.boolean :disabled
      t.boolean :deleted
      t.string :company_name, limit: 200

      t.timestamps null: false
    end
    add_index :users, :email, unique: true, :name => :idx_users_on_email
    add_foreign_key :users, :roles, name: "fk_users_roles"
    add_foreign_key :users, :companies, name: "fk_users_companies"
  end

  def self.down
    drop_table :users
  end
end
