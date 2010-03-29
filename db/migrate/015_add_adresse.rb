class AddAdresse < ActiveRecord::Migration
  def self.up
    add_column :enseignants, :adresse, :string
  end

  def self.down
    remove_column :enseignants, :adresse
  end
end
