# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def section_link(name,options)
    if options[:action] == @current_action and options[:controller] == @current_controller
      link_to(name, options, :class => 'active')
    else
      link_to(name,options)
    end
  end

  def base_language_only 
    yield if Locale.base? 
  end 

  def not_base_language 
    yield unless Locale.base? 
  end
  
  
  def enseignant_by_name(nom)
    enseignant = Enseignant.find(:first, :conditions => ["UPPER(nom) = ?", nom.upcase]) 
    return enseignant.id
  end
  
  def document_by_name(nom)
    document = Document.find_by_filename(nom)
    unless document.blank?
      return document.public_filename
    else
      return 0
    end
  end
  
  def universite_by_name(nom)
    universite = Universite.find(:first, :conditions => ["UPPER(name) = ?", nom.upcase]) 
    return universite.id unless universite.blank?
  end
  
  #format une date
  
  def month(date)
    date_text = date.to_s
    current = DateTime.parse(date_text.delete "Z")
    current.strftime('%b')
  end
  
  def day(date)
    date_text = date.to_s
    current = DateTime.parse(date_text.delete "Z")
    current.strftime('%d')
  end
  #User Admin or Not Admin  
  def is_admin?
    if logged_in?
      current_user.role  == "Admin"
    end
  end
  
  def isBolo?
    if logged_in?
      current_user.login =="bolo"
    end
  end
  
  def name_user
    current_user.login
  end
end
