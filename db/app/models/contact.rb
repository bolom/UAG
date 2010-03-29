class Contact < Tableless
  self.keep_translations_in_model = false
  column  :subject,      :string
  column  :message,      :text

  
  validates_presence_of :message
  validates_presence_of :subject
end
