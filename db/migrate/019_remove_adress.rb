class RemoveAdress < ActiveRecord::Migration
  def self.up
    remove_column :enseignements, :adresse
  end

  def self.down
    add_column :enseignements, :adresse,     :string
  end
end
