require File.dirname(__FILE__) + '/../test_helper'
require 'universites_controller'

# Re-raise errors caught by the controller.
class UniversitesController; def rescue_action(e) raise e end; end

class UniversitesControllerTest < Test::Unit::TestCase
  fixtures :universites

  def setup
    @controller = UniversitesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:universites)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_universite
    old_count = Universite.count
    post :create, :universite => { }
    assert_equal old_count+1, Universite.count
    
    assert_redirected_to universite_path(assigns(:universite))
  end

  def test_should_show_universite
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_universite
    put :update, :id => 1, :universite => { }
    assert_redirected_to universite_path(assigns(:universite))
  end
  
  def test_should_destroy_universite
    old_count = Universite.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Universite.count
    
    assert_redirected_to universites_path
  end
end
