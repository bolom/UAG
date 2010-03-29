class AddType < ActiveRecord::Migration
  def self.up
    add_column :enseignants, :groupe, :string
  end

  def self.down
    remove_column :enseignants, :groupe
  end
end
