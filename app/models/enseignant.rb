class Enseignant < ActiveRecord::Base
  before_validation :chek_filemane
  
  self.keep_translations_in_model = true
  translates :recherche, :publication, :personal, :fonction, :base_as_default => true
  
  has_many :contributions
  has_many :enseignements, :through => :contributions
  has_one :user
  
  validates_presence_of :nom , :message  => "ne peut être vide"
  validates_presence_of :prenom, :message  => "ne peut être vide"
  validates_presence_of :email, :message  => "ne peut être vide"
    validates_format_of(:email,
                      :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                      :on => :create,
                      :message=>"format invalide")
  has_attachment  :storage => :file_system,
                  :content_type => :image,
                  :path_prefix => "public/upload/#{table_name}",
                  :max_size => 500.kilobytes,
                  :resize_to => '250x250>' 
                  
  def before_save
      self.nom = self.nom.downcase
  end
  
  def chek_filemane
    self.class.validates_as_attachment unless self.filename.blank?
  end
  
  def adress(langue)
    #chargement du fichier de configuration
    adresse = YAML::load(IO.read("#{RAILS_ROOT}/db/adresses.yml"))
    return   adresse["#{self.adresse}_#{langue}"]
  end

  def adresses
    adresse = YAML::load(IO.read("#{RAILS_ROOT}/db/adresses.yml"))
    return adresse['adresses']
  end
  
  
  def full_filename(thumbnail = nil)
    if filename.blank?
        File.join(RAILS_ROOT, "public/images", "no_pic.jpg")
    else
        file_system_path = (thumbnail ? thumbnail_class : self).attachment_options[:path_prefix].to_s
        File.join(RAILS_ROOT, file_system_path, *partitioned_path(thumbnail_name_for(thumbnail)))
    end
  end
end
