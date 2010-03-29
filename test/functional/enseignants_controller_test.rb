require File.dirname(__FILE__) + '/../test_helper'
require 'enseignants_controller'

# Re-raise errors caught by the controller.
class EnseignantsController; def rescue_action(e) raise e end; end

class EnseignantsControllerTest < Test::Unit::TestCase
  fixtures :enseignants

  def setup
    @controller = EnseignantsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:enseignants)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_enseignant
    old_count = Enseignant.count
    post :create, :enseignant => { }
    assert_equal old_count+1, Enseignant.count
    
    assert_redirected_to enseignant_path(assigns(:enseignant))
  end

  def test_should_show_enseignant
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_enseignant
    put :update, :id => 1, :enseignant => { }
    assert_redirected_to enseignant_path(assigns(:enseignant))
  end
  
  def test_should_destroy_enseignant
    old_count = Enseignant.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Enseignant.count
    
    assert_redirected_to enseignants_path
  end
end
