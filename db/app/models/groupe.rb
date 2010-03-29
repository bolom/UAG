class Groupe < ActiveRecord::Base
  self.keep_translations_in_model = true
  translates :title,:base_as_default => true
  
  has_many :groupements,  :dependent => :nullify
  has_many :enseignements, :through => :groupements , :order => :libelle
  
  def self.find_with_enseignements
    find(:all, :readonly => false,
         :select => "DISTINCT groupes.*",
         :joins => "LEFT OUTER JOIN groupements e ON groupes.id = e.groupe_id",
         :conditions => "e.id IS NOT NULL AND groupes.type_groupe = 'parcours'")
  end
  
  #trouver tous les groupes de type parcours
  
  def self.all_parcours
    find(:all,:conditions => {:type_groupe => "parcours"})    
  end
end
