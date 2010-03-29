require File.dirname(__FILE__) + '/../test_helper'
require 'enseignements_controller'

# Re-raise errors caught by the controller.
class EnseignementsController; def rescue_action(e) raise e end; end

class EnseignementsControllerTest < Test::Unit::TestCase
  fixtures :enseignements

  def setup
    @controller = EnseignementsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:enseignements)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_enseignement
    old_count = Enseignement.count
    post :create, :enseignement => { }
    assert_equal old_count+1, Enseignement.count
    
    assert_redirected_to enseignement_path(assigns(:enseignement))
  end

  def test_should_show_enseignement
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_enseignement
    put :update, :id => 1, :enseignement => { }
    assert_redirected_to enseignement_path(assigns(:enseignement))
  end
  
  def test_should_destroy_enseignement
    old_count = Enseignement.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Enseignement.count
    
    assert_redirected_to enseignements_path
  end
end
