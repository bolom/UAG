class CreateEnseignants < ActiveRecord::Migration
  def self.up
    create_table :enseignants do |t|
      t.column :nom, :string
      t.column :prenom, :string
      t.column :photo, :string
      t.column :email, :string
      t.column :telephone, :string
      t.column :recherche, :text
      t.column :publication, :text
      t.column :personal, :text
    end
  end

  def self.down
    drop_table :enseignants
  end
end
