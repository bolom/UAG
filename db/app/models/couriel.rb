class Couriel < ActiveRecord::Base
  self.keep_translations_in_model = false
 
  belongs_to :mailling_list
  
  validates_presence_of :email
    validates_format_of(:email,
                      :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                      :on => :create,
                      :message=>"has an invalid format")
end
