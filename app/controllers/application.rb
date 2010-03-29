class ApplicationController < ActionController::Base
  include AuthenticatedSystem

  before_filter :login_from_cookie, :set_locale
  
  # Pick a unique cookie name to distinguish our session data from others'
  session :secret => "université antille guyane"
  session :session_key => '_uag_session_id'

  def set_locale
    default_locale = 'fr-FR'

    @locale = params[:locale] || session[:locale] || default_locale
    session[:locale] = @locale
    begin
      Locale.set @locale
      redirect_to params.merge( 'locale' => Locale.language.code ) and return false if params[:locale].nil?
    rescue
      Locale.set default_locale
      redirect_to params.merge( 'locale' => Locale.language.code ) and return false
    end
  end
  
  #**
  # Méthodes lié au utilisateur
  #
  
  def local_request?
     false
  end
  
  def render_404
    render :file => "#{RAILS_ROOT}/public/404.html", :status => 404
  end
  
  protected
  # user est un admin?
  def is_admin_user
     if current_user != :false
        if current_user.role == "Admin"
          return true
        else
          access_denied
        end
      else
        access_denied
      end
  end
  
  def login_prof_required
    logged_in? && current_user.role != "Elève" ? true : access_denied
  end
  
  #se souvenir de l'utilisateur
  def login_from_cookie
    return unless cookies[:auth_token] && !logged_in?
    user = User.find_by_remember_token(cookies[:auth_token])
    if user && user.remember_token?
      user.remember_me
      self.current_user = user
      cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      flash[:notice] = "Vous êtes connecté"
    end
  end
  
  #refusé l'acces retour à la page d'acceuil
   def access_denied
     respond_to do |accepts|
       accepts.html do
         store_location
        redirect_to '/'

       end
       accepts.xml do
         headers["Status"]           = "Unauthorized"
         headers["WWW-Authenticate"] = %(Basic realm="Web Password")
         render :text => "Could't authenticate you", :status => '401 Unauthorized'
       end
     end
     false
   end 
  # les Groupes
  def find_all_parcours
    @parcours = Groupe.all_parcours
    @m1 = Groupe.find(6)
    @m2 = Groupe.find(7)
    
    @l1 =  Groupe.find(3)
    @l2 =  Groupe.find(4)
    @l3 =  Groupe.find(5)
    
    @schoelcher = Groupe.find(17)
    @saint_claude = Groupe.find(8)
    
    @master  = Groupe.find(2)
    @licence  = Groupe.find(1)
  end
end

