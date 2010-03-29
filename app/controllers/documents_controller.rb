class DocumentsController < ApplicationController
  before_filter :login_required ,:except =>  [ :index ]

  def create
    if !params[:groupe_document_id].blank?
      groupe = GroupeDocument.find params[:groupe_document_id]
      groupe.documents.create! params[:document]
    else
        @document = Document.new params[:document]
        @document.save!
    end
    flash[:notice] = 'Le document a été ajouté'
    redirect_to :back
  rescue ActiveRecord::RecordInvalid
    flash[:notice] = "Le document n'a pu être ajouté"
    redirect_to :back
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to :back
  end
  
  def index
     @documents = Document.find(:all)
     case params[:menu]  
     when "user"
       if logged_in?
        @page = "shared/menu_user"
       else
       access_denied
       end
     else
       @page = 'shared/menu_documents'  
     end
  end
  
  def edit
    @document = Document.find params[:id]
    @groupes = GroupeDocument.find :all
  end
  
  #Editr le document
  def update
    @document = Document.find(params[:id])
    if @document.update_attributes(params[:document])
      flash[:notice] = 'Le document est modifié.'
      redirect_to documents_url
    else
     render :action => "edit" 
    end
  end
end
