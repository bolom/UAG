class GlobalizeAddTranslatedFieldsForEnseignementEnseignant < ActiveRecord::Migration
  def self.up
    #Fields for Enseignement
    add_column :enseignements, :libelle_en, :text, :default => ''
    add_column :enseignements, :contenu_en, :string, :default => ''
    add_column :enseignements, :question_en, :text, :default => ''
    add_column :enseignements, :objectif_en, :text, :default => ''
    add_column :enseignements, :plan_en, :text, :default => ''
    add_column :enseignements, :bibliographie_en, :text, :default => ''
    add_column :enseignements, :evaluation_en, :text, :default => ''
    add_column :enseignements, :remarque_en, :text, :default => ''    
  end

  def self.down
    #Fields for Enseignement
    remove_column :enseignements, :libelle_en
    remove_column :enseignements, :contenu_en
    remove_column :enseignements, :question_en
    remove_column :enseignements, :objectif_en
    remove_column :enseignements, :plan_en
    remove_column :enseignements, :bibliographie_en
    remove_column :enseignements, :evaluation_en
    remove_column :enseignements, :remarque_en
    #Fields for Enseignant
  end
end