class AddAnnneLieu < ActiveRecord::Migration
  def self.up
    add_column :enseignements, :annee, :string
    add_column :enseignements, :parcour_id, :integer
    add_column :enseignements, :adresse, :string
  end

  def self.down
    remove_column :enseignements, :annee
    remove_column :enseignements, :parcour_id
    remove_column :enseignements, :adresse
  end
end
