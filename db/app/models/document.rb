class Document < ActiveRecord::Base
  self.keep_translations_in_model = true

  translates :description

  belongs_to :groupe_document

  has_attachment  :storage => :file_system,
  :max_size => 7.megabytes, 
  :path_prefix => "public/upload/#{table_name}"
  
  validates_as_attachment

  def self.parent_docs(user)
    find_all_by_user_id(user)
  end

end
