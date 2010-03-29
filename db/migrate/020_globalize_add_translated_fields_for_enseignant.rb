
class GlobalizeAddTranslatedFieldsForEnseignant < ActiveRecord::Migration
  def self.up
    #Fields for Enseignant
    add_column :enseignants, :recherche_en, :text, :default => ''
    add_column :enseignants, :publication_en, :text, :default => ''
    add_column :enseignants, :personal_en, :text, :default => ''
  end

  def self.down
    #Fields for Enseignant
    remove_column :enseignants, :recherche_en
    remove_column :enseignants, :publication_en
    remove_column :enseignants, :personal_en
  end
end