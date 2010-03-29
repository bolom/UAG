class UsersController < ApplicationController

  before_filter :login_required
  before_filter :is_admin_user, :except   => [:show]
  before_filter :find_user, :only   => [:edit, :update, :destroy , :show]
  def new
    @user = User.new
    @profs = Enseignant.find :all
  end

  def create
    @user = User.new(params[:user])
    @user.save!
    self.current_user = @user
    flash[:notice] = "L'utilisateur est crée"
    redirect_to users_url
  rescue ActiveRecord::RecordInvalid => invalid
    flash[:notice] = invalid.to_s
    redirect_to users_url
  end

  def index
    @users  = User.find :all

  end

  def show
    @listes = MaillingList.find :all
    @groupes = GroupeDocument.find :all
    @profs = Enseignant.find :all
    @mailling_list =MaillingList.new
  end

  #seul admin peut edit les users
  def edit
    @profs = Enseignant.find :all
  end

  #Editer la catégories et la sauvegarde dans la bdd
  def update
    @user.update_attributes params[:user]
    @user.save!
    flash[:notice] = "Mise à jours"
    redirect_to users_url
  rescue  ActiveRecord::RecordInvalid #intercepte les execeptions
    flash[:notice] = "Mise à jours"
    redirect_to users_url
  end

  #suprime l'utilisateur
  def destroy
    @user.destroy
    flash[:notice] = "Utilisateur n'existe plus"
    redirect_to users_url
  end

  protected
  #récupère id de la catégorie
  def find_user
    @user = User.find params[:id]
  rescue  ActiveRecord::RecordNotFound
      render_404 #affiche la page 404
  end
end
