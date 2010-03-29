class GroupeDocumentsController < ApplicationController
    before_filter :login_required  ,:except =>  [ :index,   :show ]
   in_place_edit_for :groupe_document, :label
   
   def index
    @groupes = GroupeDocument.find :all
    case params[:menu]  
    when "user"
      @page = "shared/menu_user"
      @user = self.current_user
    else
      @page = 'shared/menu_documents'  
    end
   end
  # GET /groupe_documents/1
  # GET /groupe_documents/1.xml
  def show
    @groupe_document = GroupeDocument.find(params[:id])
    case params[:menu]  
     when "user"
       @page = "shared/menu_user"
       @user = self.current_user
     else
       @page = 'shared/menu_documents'  
     end
    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @groupe_document.to_xml }
    end
  end


  # POST /groupe_documents
  # POST /groupe_documents.xml
  def create
    @groupe_document = GroupeDocument.new(params[:groupe_document])

    respond_to do |format|
      if @groupe_document.save
        flash[:notice] = 'Le nouveau groupe a été crée'
        format.html { redirect_to :back }
      else
          format.html { redirect_to :back }
      end
    end
  end

  # PUT /groupe_documents/1
  # PUT /groupe_documents/1.xml
  def update
    @groupe_document = GroupeDocument.find(params[:id])

    respond_to do |format|
      if @groupe_document.update_attributes(params[:groupe_document])
        flash[:notice] = 'GroupeDocument was successfully updated.'
        format.html { redirect_to groupe_document_url(@groupe_document) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @groupe_document.errors.to_xml }
      end
    end
  end

  # DELETE /groupe_documents/1
  # DELETE /groupe_documents/1.xml
  def destroy
    @groupe_document = GroupeDocument.find(params[:id])
    @groupe_document.destroy

    respond_to do |format|
      format.html { redirect_to :back}
      format.xml  { head :ok }
    end
  end
end
