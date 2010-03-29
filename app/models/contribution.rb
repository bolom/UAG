class Contribution < ActiveRecord::Base
  self.keep_translations_in_model = false
  belongs_to :enseignement
 # belongs_to :contribution, :polymorphic => true
  
  belongs_to :enseignant
  #belongs_to :contribution, :polymorphic => true
end
