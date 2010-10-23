require File.dirname(__FILE__) + '/../test_helper'
require 'citizens_controller'

# Re-raise errors caught by the controller.
class CitizensController; def rescue_action(e) raise e end; end

class CitizensControllerTest < ActionController::TestCase
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead
  # Then, you can remove it from this and the units test.
  include AuthenticatedTestHelper

  fixtures :citizens

  def test_should_allow_signup
    assert_difference 'Citizen.count' do
      create_citizen
      assert_response :redirect
    end
  end

  def test_should_require_login_on_signup
    assert_no_difference 'Citizen.count' do
      create_citizen(:login => nil)
      assert assigns(:citizen).errors.on(:login)
      assert_response :success
    end
  end

  def test_should_require_password_on_signup
    assert_no_difference 'Citizen.count' do
      create_citizen(:password => nil)
      assert assigns(:citizen).errors.on(:password)
      assert_response :success
    end
  end

  def test_should_require_password_confirmation_on_signup
    assert_no_difference 'Citizen.count' do
      create_citizen(:password_confirmation => nil)
      assert assigns(:citizen).errors.on(:password_confirmation)
      assert_response :success
    end
  end

  def test_should_require_email_on_signup
    assert_no_difference 'Citizen.count' do
      create_citizen(:email => nil)
      assert assigns(:citizen).errors.on(:email)
      assert_response :success
    end
  end
  

  

  protected
    def create_citizen(options = {})
      post :create, :citizen => { :login => 'quire', :email => 'quire@example.com',
        :password => 'quire69', :password_confirmation => 'quire69' }.merge(options)
    end
end
