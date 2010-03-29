class GroupesController < ApplicationController
   before_filter :login_required
   before_filter :find_id , :except => [ :index, :create ]
   before_filter :find_all_parcours, :except   => [:create, :update, :destroy]
   in_place_edit_for :groupe, :title
  
  # GET /parcours
  # GET /parcours.xml
  def index
    @groupes = Groupe.find(:all)
    @groupe = Groupe.new
    respond_to do |format|
      format.html # index.erb
      format.xml  { render :xml => @parcours.to_xml }
    end
  end

  # GET /parcours/1
  # GET /parcours/1.xml
  def show
    @groupes = Groupe.find(:all)
    @groupement = Groupement.new
    @enseignement = Enseignement.new
    @enseignements = Enseignement.find(:all)
    respond_to do |format|
      format.html # show.erb
      format.xml  { render :xml => @groupe.to_xml }
    end
  end

  # GET /parcours/new
  def new; end

  # GET /parcours/1;edit
  def edit
    @parcour = Parcour.find_with_enseignements
    respond_to do |format|
      format.html # edit.erb
      format.js
    end
  end

  # POST /parcours
  # POST /parcours.xml
  def create
    @groupe = Groupe.new(params[:groupe])
    @groupe.save!
     flash[:notice] = 'Le noveau groupe a été ajouté.'
     redirect_to groupes_url 
    rescue  ActiveRecord::RecordInvalid 
      flash[:notice] = ' il y a eu un problème'
       render :action => :new
  end

  # PUT /parcours/1
  # PUT /parcours/1.xml
  def update
    respond_to do |format|
      if @groupe.update_attributes(params[:groupe])
        flash[:notice] = 'groupe modifié.'
        format.html { redirect_to parcours_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @groupe.errors.to_xml }
      end
    end
  end

  # DELETE /parcours/1
  # DELETE /parcours/1.xml
  def destroy
    @id = params[:id]
    @groupe.destroy
    respond_to do |format|
      format.html { flash[:notice] = 'Le groupe a été suprimé'; redirect_to groupes_url }
      format.js
    end
  end
  
  protected 
    
    def find_all_objects
        @parcour_with_enseignement = Groupe.find_with_enseignements
    end
    
    def find_id
        @groupe = Groupe.find(params[:id])
    end
end
