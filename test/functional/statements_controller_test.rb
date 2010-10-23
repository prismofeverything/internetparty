require 'test_helper'

class StatementsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create statement" do
    assert_difference('Statement.count') do
      post :create, :statement => { }
    end

    assert_redirected_to statement_path(assigns(:statement))
  end

  test "should show statement" do
    get :show, :id => statements(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => statements(:one).to_param
    assert_response :success
  end

  test "should update statement" do
    put :update, :id => statements(:one).to_param, :statement => { }
    assert_redirected_to statement_path(assigns(:statement))
  end

  test "should destroy statement" do
    assert_difference('Statement.count', -1) do
      delete :destroy, :id => statements(:one).to_param
    end

    assert_redirected_to statements_path
  end
end
