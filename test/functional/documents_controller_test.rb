require File.dirname(__FILE__) + '/../test_helper'
require 'documents_controller'

# Re-raise errors caught by the controller.
class DocumentsController; def rescue_action(e) raise e end; end

class DocumentsControllerTest < Test::Unit::TestCase
  fixtures :documents

  def setup
    @controller = DocumentsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:documents)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_documents
    old_count = Documents.count
    post :create, :documents => { }
    assert_equal old_count+1, Documents.count
    
    assert_redirected_to documents_path(assigns(:documents))
  end

  def test_should_show_documents
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_documents
    put :update, :id => 1, :documents => { }
    assert_redirected_to documents_path(assigns(:documents))
  end
  
  def test_should_destroy_documents
    old_count = Documents.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Documents.count
    
    assert_redirected_to documents_path
  end
end
