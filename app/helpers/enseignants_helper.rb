module EnseignantsHelper
  def asset_image_for(asset, thumbnail = :tiny, options = {})
    image_tag(*asset_image_args_for(asset, thumbnail, options))
  end
  
  def current_prof?(enseignant)
    if logged_in?
      return current_user.role != "Elève"
      return current_user.enseignant_id == enseignant
      return current_user.role == "Admin"
    end
  end

end
