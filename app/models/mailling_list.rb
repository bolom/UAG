class MaillingList < ActiveRecord::Base
  validates_presence_of :label, :message => "une liste doit avoir un titre"
  validates_uniqueness_of   :label
  
  has_many :couriels
end
