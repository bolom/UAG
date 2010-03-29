class EnseignementsController < ApplicationController
    before_filter :login_required , :except => [ :index, :show ]
    before_filter :is_admin? , :only => [ :destroy]
    before_filter :find_all_parcours, :except   => [:create, :update, :destroy]
    before_filter :find_id , :except => [ :index, :create, :new ]
    before_filter :find_all_groupe_document

  #cache_page :index, :show
  
  def index
    unless params[:tag].blank?
      groupe  = Groupe.find(params[:tag])
      @enseignements = Groupe.find(params[:tag]).enseignements
      
      case groupe.type_groupe
      when "cycle"
        @title = "Liste de cours".t + " "+ groupe.title
       when "parcours"
          @title = "Liste de cours".t + " "+groupe.title
      when "lieu"
          @title = "Liste des cours".t + " "+groupe.title
      end
    
    else
      @enseignements = Enseignement.find(:all, :order => :libelle)
      @title = "Tous les enseignements du département d'Histoire".t
    end
    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @enseignements.to_xml }
    end
  end

  # GET /enseignements/1
  # GET /enseignements/1.xml
  def show
    @enseignants = @enseignement.enseignants
    @groupes = Groupe.find(:all)
    @parcours = @enseignement.parcours
    
    #titre
   @page_title =   "#{@enseignement.libelle}"
    #tous les documents liés à l'enseignements
    unless @enseignement.groupe_document.blank?
        @documents = @enseignement.groupe_document.documents
    end
  
    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @enseignement.to_xml }
    end
  end

  # GET /enseignements/new
  def new
    @enseignement = Enseignement.new
    @documents    = Document.find(:all)
    @parcours = Groupe.all_parcours
  end

  # GET /enseignements/1;edit
  def edit
    @documents    = Document.find(:all)
  end


  def create
    @enseignement = Enseignement.new(params[:enseignement])
    @enseignement.save!
    flash[:notice] = 'Enseignement a été ajouté.'
    redirect_to enseignement_url(:id => @enseignement)
  rescue ActiveRecord::RecordInvalid  
    render :action => :new
  end


  def update
    @enseignement = Enseignement.find(params[:id])
    if @enseignement.update_attributes(params[:enseignement])
      flash[:notice] = 'Enseignement a été modifié.'
      redirect_to enseignement_path(:id => @enseignement) 
    else
      render :action => "edit" 
    end
  end

  # DELETE /enseignements/1
  # DELETE /enseignements/1.xml
  def destroy
    @enseignement = Enseignement.find(params[:id])
    @enseignement.destroy

    respond_to do |format|
      format.html { redirect_to enseignements_url }
      format.xml  { head :ok }
    end
  end
  
  protected     
    def find_id
       @enseignement = Enseignement.find(params[:id])
    end
    
    def find_all_groupe_document
      @groupe_documents = GroupeDocument.find :all
    end
    def is_admin?
      if current_user == :false || current_user.role != "Admin"
        access_denied
      end
    end
end
