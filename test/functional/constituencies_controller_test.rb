require 'test_helper'

class ConstituenciesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:constituencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create constituency" do
    assert_difference('Constituency.count') do
      post :create, :constituency => { }
    end

    assert_redirected_to constituency_path(assigns(:constituency))
  end

  test "should show constituency" do
    get :show, :id => constituencies(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => constituencies(:one).to_param
    assert_response :success
  end

  test "should update constituency" do
    put :update, :id => constituencies(:one).to_param, :constituency => { }
    assert_redirected_to constituency_path(assigns(:constituency))
  end

  test "should destroy constituency" do
    assert_difference('Constituency.count', -1) do
      delete :destroy, :id => constituencies(:one).to_param
    end

    assert_redirected_to constituencies_path
  end
end
