class AddRole < ActiveRecord::Migration
  def self.up
    add_column :users, :role, :string
    remove_column :users, :is_admin
  end

  def self.down
    remove_column :users, :role
    add_column :users, :is_admin,                  :boolean
  end
end
