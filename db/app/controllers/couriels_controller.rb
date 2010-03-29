class CourielsController < ApplicationController
  before_filter :login_required , :except => [ :create]

  def create
    MaillingList.find(params[:mailling_list_id]).couriels.create! params[:couriel]
    flash[:notice] = 'Votre email a été ajouté'
    redirect_to :back 
  rescue ActiveRecord::RecordInvalid
    flash[:notice] = "Votre email n' a pas été ajouté"
    redirect_to :back
  end

  def destroy
    @couriel = Couriel.find(params[:id])
    @couriel.destroy
    redirect_to :back
  end

end
