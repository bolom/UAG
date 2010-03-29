require File.dirname(__FILE__) + '/../test_helper'
require 'parcours_controller'

# Re-raise errors caught by the controller.
class ParcoursController; def rescue_action(e) raise e end; end

class ParcoursControllerTest < Test::Unit::TestCase
  fixtures :parcours

  def setup
    @controller = ParcoursController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:parcours)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_parcour
    old_count = Parcour.count
    post :create, :parcour => { }
    assert_equal old_count+1, Parcour.count
    
    assert_redirected_to parcour_path(assigns(:parcour))
  end

  def test_should_show_parcour
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_parcour
    put :update, :id => 1, :parcour => { }
    assert_redirected_to parcour_path(assigns(:parcour))
  end
  
  def test_should_destroy_parcour
    old_count = Parcour.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Parcour.count
    
    assert_redirected_to parcours_path
  end
end
