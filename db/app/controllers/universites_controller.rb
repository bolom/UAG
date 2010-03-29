class UniversitesController < ApplicationController
  before_filter :login_required 
  

  # GET /universites/new
  def new
    @universite = Universite.new
  end

  # GET /universites/1;edit
  def edit
    @universite = Universite.find(params[:id])
  end

  # POST /universites
  # POST /universites.xml
  def create
    @universite = Universite.new(params[:universite])

    respond_to do |format|
      if @universite.save
        flash[:notice] = "L'université a été ajouté"
        format.html { redirect_to :controller => "pages", :action => "partenaires" }
        format.xml  { head :created, :location => universite_url(@universite) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @universite.errors.to_xml }
      end
    end
  end

  # PUT /universites/1
  # PUT /universites/1.xml
  def update
    @universite = Universite.find(params[:id])

    respond_to do |format|
      if @universite.update_attributes(params[:universite])
        flash[:notice] = 'Universite was successfully updated.'
       format.html { redirect_to :controller => "pages", :action => "partenaires" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @universite.errors.to_xml }
      end
    end
  end

  # DELETE /universites/1
  # DELETE /universites/1.xml
  def destroy
    @universite = Universite.find(params[:id])
    @universite.destroy

    respond_to do |format|
     format.html { redirect_to :controller => "pages", :action => "partenaires" }
      format.xml  { head :ok }
    end
  end
end
