class GroupementsController < ApplicationController
  before_filter :login_required
  
  def create
    @groupement = Groupement.new(params[:groupement])
    @groupement.save!
    @groupe = @groupement.groupe
    @type_groupement = params[:groupement][:type]
    respond_to do |format| 
      format.js
      format.html {flash[:notice] = "Le groupement a été ajouté";redirect_to groupe_path(:id => @groupe) }
    end
    rescue  ActiveRecord::RecordInvalid 
      respond_to do |format|
        format.html {redirect_to :back}
        format.js
      end
  end

  def destroy
    @id = params[:id]
    @groupement = Groupement.find(params[:id])
    @groupe = @groupement.groupe_id
    @groupement.destroy
    respond_to do |format|
      format.html { flash[:notice] = 'Le groupe a été suprimé'; redirect_to groupe_path(:id => @groupe) }
      format.js
    end
  end 
end