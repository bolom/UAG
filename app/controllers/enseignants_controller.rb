class EnseignantsController < ApplicationController
  before_filter :login_required ,   :except =>  [ :index,   :show ]
  before_filter :find_enseignant ,  :only   =>  [ :update,  :edit, :show ]
  before_filter :is_the_prof, :only   => [:edit, :update, :destroy]
  
  #Cacche les pages
  #cache_page :index, :show
  
  def index
    case params[:tag]
    when "Archeo"
      @enseignants = Enseignant.find_all_by_groupe(params[:tag], :order => "nom")
      @titre = 'ArchÉologie'.t
    when "Hist_anci"
      @enseignants = Enseignant.find_all_by_groupe(params[:tag], :order => "nom")
      @titre = 'Histoire ancienne'.t
    when "Hist_medi"
      @enseignants = Enseignant.find_all_by_groupe(params[:tag], :order => "nom")
      @titre = 'Histoire mÉdiÉvale'.t
    when "Hist_mode"
      @enseignants = Enseignant.find_all_by_groupe(params[:tag], :order => "nom")
      @titre = 'Histoire moderne'.t
    when "Hist_conte"
      @enseignants = Enseignant.find_all_by_groupe(params[:tag], :order => "nom")
      @titre = 'Histoire contemporaine'.t
    when "Ext"
      @enseignants = Enseignant.find_all_by_groupe(params[:tag], :order => "nom")
      @titre = 'Intervenants externes'.t
      when "Adm"
        @enseignants = Enseignant.find_all_by_groupe(params[:tag], :order => "nom")
        @titre = 'Administratif'.t
    else  
      @titre = ""
       @enseignants = Enseignant.find(:all, :order => "nom" , :conditions => ["groupe NOT LIKE 'Ext' AND groupe NOT LIKE 'Adm'"])
    end
    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @enseignants.to_xml }
    end
  end

  # GET /enseignants/1
  # GET /enseignants/1.xml
  def show
    @adresse = @enseignant.adress(session[:locale])
     #########################################
     # Les Contributions de Cette enseigant
     @prof_enseigns = @enseignant.enseignements
     @contribution = Contribution.new 
     @enseignements = Enseignement.find(:all, :order => "libelle")
     @enseignants = Enseignant.find(:all, :order => "nom")
     
     #titre
      @page_title =   "#{@enseignant.prenom} #{ @enseignant.nom.upcase}"
  end

  def new
    @enseignant = Enseignant.new
  end

  def edit; end

  def create
    @enseignant = Enseignant.new params[:enseignant]
    @enseignant.save!
    flash[:notice] = "L'enseignant à été ajouté" 
    redirect_to enseignant_url(:id => @enseignant)
  rescue ActiveRecord::RecordInvalid  
    render :action => :new
  end

  def update
    if @enseignant.update_attributes(params[:enseignant])
      flash[:notice] = "L'enseignant à été modifié"
      redirect_to enseignant_path(:id => @enseignant) 
    else
      render :action => :edit
    end
  end
  
  def destroy
    @enseignant = Enseignant.find(params[:id])
    @enseignant.destroy
    redirect_to enseignants_url
  end
  
  protected
  def find_enseignant
    @enseignant = Enseignant.find(params[:id])
    rescue ActiveRecord::RecordInvalid
      render_404 #affiche la page 404
  end
  
  def is_the_prof
    if current_user != :false
        case current_user.role 
        when "Elève"
          access_denied
        when "Prof"
          redirect_to enseignants_url if current_user.enseignant_id != @enseignant.id
        end
      else 
        access_denied
       end
  end
  
  
end