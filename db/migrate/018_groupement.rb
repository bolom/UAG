class Groupement < ActiveRecord::Migration
  def self.up
    create_table :groupements do |t|
      t.column :groupe_id, :integer
      t.column :enseignement_id, :integer
    end
    
    create_table :groupes do |t|
      t.column :title, :string
      t.column :type_groupe, :string
    end
    
    remove_column :enseignements, :cycle
    remove_column :enseignements, :parcour_id       
  end

  def self.down
    drop_table :groupements
    drop_table :groupes
    add_column :enseignements, :cycle,         :string
    add_column :enseignements, :parcour_id,    :integer
  end
end
