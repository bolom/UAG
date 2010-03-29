require File.dirname(__FILE__) + '/../test_helper'
require 'mailings_controller'

# Re-raise errors caught by the controller.
class MailingsController; def rescue_action(e) raise e end; end

class MailingsControllerTest < Test::Unit::TestCase
  fixtures :mailings

  def setup
    @controller = MailingsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:mailings)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_mailing
    old_count = Mailing.count
    post :create, :mailing => { }
    assert_equal old_count+1, Mailing.count
    
    assert_redirected_to mailing_path(assigns(:mailing))
  end

  def test_should_show_mailing
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_mailing
    put :update, :id => 1, :mailing => { }
    assert_redirected_to mailing_path(assigns(:mailing))
  end
  
  def test_should_destroy_mailing
    old_count = Mailing.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Mailing.count
    
    assert_redirected_to mailings_path
  end
end
