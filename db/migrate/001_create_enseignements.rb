class CreateEnseignements < ActiveRecord::Migration
  def self.up
    create_table :enseignements do |t|
      t.column :libelle, :string
      t.column :volume, :string
      t.column :heures_perso, :string
      t.column :ects, :string
      t.column :question, :text
      t.column :objectif, :text
      t.column :bibliographie, :text
      t.column :evaluation, :text
      t.column :remarque, :text
      t.column :plan, :text
    end
  end

  def self.down
    drop_table :enseignements
  end
end
