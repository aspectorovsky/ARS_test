class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies, :force => true do |t|
      t.string :name, null:false, limit: 200
      t.boolean :disabled
      t.boolean :deleted

      t.timestamps null: false
    end
    add_index :companies, :name, :unique => true, :name => :idx_companies_on_name
    execute "INSERT INTO companies (name,created_at, updated_at) values ('Temp',now(), now())"
  end

  def self.down
    drop_table :companies
  end
end
