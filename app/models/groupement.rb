class Groupement < ActiveRecord::Base
  self.keep_translations_in_model = false
  belongs_to :groupe
  belongs_to :enseignement
end
