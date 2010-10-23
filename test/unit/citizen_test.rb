require File.dirname(__FILE__) + '/../test_helper'

class CitizenTest < ActiveSupport::TestCase
  # Be sure to include AuthenticatedTestHelper in test/test_helper.rb instead.
  # Then, you can remove it from this and the functional test.
  include AuthenticatedTestHelper
  fixtures :citizens

  def test_should_create_citizen
    assert_difference 'Citizen.count' do
      citizen = create_citizen
      assert !citizen.new_record?, "#{citizen.errors.full_messages.to_sentence}"
    end
  end

  def test_should_require_login
    assert_no_difference 'Citizen.count' do
      u = create_citizen(:login => nil)
      assert u.errors.on(:login)
    end
  end

  def test_should_require_password
    assert_no_difference 'Citizen.count' do
      u = create_citizen(:password => nil)
      assert u.errors.on(:password)
    end
  end

  def test_should_require_password_confirmation
    assert_no_difference 'Citizen.count' do
      u = create_citizen(:password_confirmation => nil)
      assert u.errors.on(:password_confirmation)
    end
  end

  def test_should_require_email
    assert_no_difference 'Citizen.count' do
      u = create_citizen(:email => nil)
      assert u.errors.on(:email)
    end
  end

  def test_should_reset_password
    citizens(:quentin).update_attributes(:password => 'new password', :password_confirmation => 'new password')
    assert_equal citizens(:quentin), Citizen.authenticate('quentin', 'new password')
  end

  def test_should_not_rehash_password
    citizens(:quentin).update_attributes(:login => 'quentin2')
    assert_equal citizens(:quentin), Citizen.authenticate('quentin2', 'monkey')
  end

  def test_should_authenticate_citizen
    assert_equal citizens(:quentin), Citizen.authenticate('quentin', 'monkey')
  end

  def test_should_set_remember_token
    citizens(:quentin).remember_me
    assert_not_nil citizens(:quentin).remember_token
    assert_not_nil citizens(:quentin).remember_token_expires_at
  end

  def test_should_unset_remember_token
    citizens(:quentin).remember_me
    assert_not_nil citizens(:quentin).remember_token
    citizens(:quentin).forget_me
    assert_nil citizens(:quentin).remember_token
  end

  def test_should_remember_me_for_one_week
    before = 1.week.from_now.utc
    citizens(:quentin).remember_me_for 1.week
    after = 1.week.from_now.utc
    assert_not_nil citizens(:quentin).remember_token
    assert_not_nil citizens(:quentin).remember_token_expires_at
    assert citizens(:quentin).remember_token_expires_at.between?(before, after)
  end

  def test_should_remember_me_until_one_week
    time = 1.week.from_now.utc
    citizens(:quentin).remember_me_until time
    assert_not_nil citizens(:quentin).remember_token
    assert_not_nil citizens(:quentin).remember_token_expires_at
    assert_equal citizens(:quentin).remember_token_expires_at, time
  end

  def test_should_remember_me_default_two_weeks
    before = 2.weeks.from_now.utc
    citizens(:quentin).remember_me
    after = 2.weeks.from_now.utc
    assert_not_nil citizens(:quentin).remember_token
    assert_not_nil citizens(:quentin).remember_token_expires_at
    assert citizens(:quentin).remember_token_expires_at.between?(before, after)
  end

protected
  def create_citizen(options = {})
    record = Citizen.new({ :login => 'quire', :email => 'quire@example.com', :password => 'quire69', :password_confirmation => 'quire69' }.merge(options))
    record.save
    record
  end
end
