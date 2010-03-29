class GroupeDocument < ActiveRecord::Base
  self.keep_translations_in_model = true
  
  translates :label
  has_many :documents
  has_many :enseignements
  
  validates_presence_of :label, :on => :create, :message => "le titre ne peut être vide"
end
