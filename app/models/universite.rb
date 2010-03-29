class Universite < ActiveRecord::Base
  self.keep_translations_in_model = true
  translates :name, :definition, :students, :remarque , :link , :base_as_default => true 
  
  validates_presence_of :name, :link, :definition, :students, :on => :create, :message => "Ne peut être vide"
  
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :path_prefix => "public/upload/#{table_name}",
                 :max_size => 500.kilobytes,
                 :resize_to => '250x168>'

  validates_as_attachment
end

