class Enseignement < ActiveRecord::Base
  self.keep_translations_in_model = true
  translates :libelle, :contenu, :question, :objectif, :plan, :bibliographie, :evaluation, :remarque , :volume ,:heures_perso, :ects, :base_as_default => true
  
  belongs_to :groupe_document
  #les contributions entre les enseignant et les enseignements
  has_many :enseignants, :through => :contributions, :uniq => true
  has_many :contributions
  
  #Les groupement entre groupe (dans les parcours) et les enseignement
  has_many :groupements, :dependent => :nullify
  has_many :groupes, :through => :groupements
  
  #Tous les parcours   
  has_many :parcours, :through => :groupements, :source => :groupe,
                      :uniq => true,
                      :conditions => "groupes.type_groupe = 'parcours'"
end
