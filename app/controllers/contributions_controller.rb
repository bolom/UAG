class ContributionsController < ApplicationController
  before_filter :login_required
  before_filter :is_the_prof, :except =>  [ :create, :update,:destroy]  
  # GET /contributions
  # GET /contributions.xml
  def index
    @contributions = Contribution.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @contributions.to_xml }
    end
  end

  # GET /contributions/1
  # GET /contributions/1.xml
  def show
    @contribution = Contribution.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @contribution.to_xml }
    end
  end

  # GET /contributions/new
  def new
    @contribution = Contribution.new
    @enseignements = Enseignement.find(:all, :order => "libelle")
    @enseignants = Enseignant.find(:all, :order => "nom")
  end

  # GET /contributions/1;edit
  def edit
    @contribution = Contribution.find(params[:id])
  end

  # POST /contributions
  # POST /contributions.xml
  def create
    @contribution = Contribution.new(params[:contribution])

    respond_to do |format|
      if @contribution.save
        flash[:notice] = 'Enseignement a été ajouté.'
        format.html { redirect_to enseignant_path(:id => @contribution.enseignant) }
        #format.xml  { head :created, :location => contribution_url(@contribution) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contribution.errors.to_xml }
      end
    end
  end

  # PUT /contributions/1
  # PUT /contributions/1.xml
  def update
    @contribution = Contribution.find(params[:id])

    respond_to do |format|
      if @contribution.update_attributes(params[:contribution])
        flash[:notice] = 'Contribution was successfully updated.'
        format.html { redirect_to contribution_url(@contribution) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contribution.errors.to_xml }
      end
    end
  end

  # DELETE /contributions/1
  # DELETE /contributions/1.xml
  def destroy
    @contribution = Contribution.find(params[:id])
    @enseignant =  @contribution.enseignant
    @contribution.destroy

    respond_to do |format|
      format.html { redirect_to enseignant_path(:id => @enseignant) }
      format.xml  { head :ok }
    end
  end
  
  protected
  def is_the_prof
    if current_user.role = "Prof" && current_user != :false
        if params[:id][:enseignant_id] =! current_user.enseignant_id
          redirect_to enseignant_path(:id =>params[:id][:enseignant_id]) 
        end 
    end
  end
end
