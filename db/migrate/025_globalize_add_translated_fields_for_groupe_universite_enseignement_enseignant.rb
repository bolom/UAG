
class GlobalizeAddTranslatedFieldsForGroupeUniversiteEnseignementEnseignant < ActiveRecord::Migration
  def self.up
    #Fields for Groupe
    #Fields for Universite
    add_column :universites, :name_en, :string, :default => ''
    add_column :universites, :definition_en, :text, :default => ''
    add_column :universites, :students_en, :string, :default => ''
    add_column :universites, :remarque_en, :text, :default => ''
    #Fields for Enseignement
    #Fields for Enseignant
  end

  def self.down
    #Fields for Groupe
    #Fields for Universite
    remove_column :universites, :name_en
    remove_column :universites, :definition_en
    remove_column :universites, :students_en
    remove_column :universites, :remarque_en
    #Fields for Enseignement
    #Fields for Enseignant
  end
end