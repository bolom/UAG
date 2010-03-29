class MaillingListsController < ApplicationController
 before_filter :login_required
  # GET /mailling_lists/1
  # GET /mailling_lists/1.xml
  def show
    @mailling_list = MaillingList.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @mailling_list.to_xml }
    end
  end

  # GET /mailling_lists/new

  # GET /mailling_lists/1;edit
  def edit
    @mailling_list = MaillingList.find(params[:id])
  end

  # POST /mailling_lists
  # POST /mailling_lists.xml
  def create
    @mailling_list = MaillingList.new(params[:mailling_list])

    respond_to do |format|
      if @mailling_list.save
        flash[:notice] = 'La nouvelle liste de diffusion a été crée.'
        format.html { redirect_to :back }
        format.xml  { head :created, :location => mailling_list_url(@mailling_list) }
      else
        format.html {  redirect_to :back }
        format.xml  { render :xml => @mailling_list.errors.to_xml }
      end
    end
  end

  # PUT /mailling_lists/1
  # PUT /mailling_lists/1.xml
  def update
    @mailling_list = MaillingList.find(params[:id])

    respond_to do |format|
      if @mailling_list.update_attributes(params[:mailling_list])
        flash[:notice] = 'MaillingList was successfully updated.'
        format.html { redirect_to mailling_list_url(@mailling_list) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mailling_list.errors.to_xml }
      end
    end
  end

  # DELETE /mailling_lists/1
  # DELETE /mailling_lists/1.xml
  def destroy
    @mailling_list = MaillingList.find(params[:id])
    @mailling_list.destroy

    respond_to do |format|
      format.html { redirect_to user_path(:id => current_user) }
      format.xml  { head :ok }
    end
  end
  
  
  #envoyer un mail
  def send_mailling
    contact = Contact.new params[:contact]
    @mailling_list = MaillingList.find(params[:mailling_list_id])
    
    error = 0
    message = ""
    if contact.save
        @mailling_list.couriels.each do |abonne|
          raw_email = Mailer.create_mailing(contact,abonne.email,current_user.prof.email,params[:file])
          #raw_email.scharset=iso-8859-15
        begin
          Mailer.deliver(raw_email)
        rescue Exception => e
          error= 1
          message +=  e.message + "\n"
        end
      end
      if error == 0
        flash[:notice] = "La liste de diffusion a été envoyé par #{current_user.prof.email}"
        redirect_to :back
      else
        flash[:notice] = "Ooups il y a eu un soucis #{message}"
        redirect_to :back
      end
    else
      render :action => "show"
    end
  end
end
