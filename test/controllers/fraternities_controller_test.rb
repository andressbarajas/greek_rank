require 'test_helper'

class FraternitiesControllerTest < ActionController::TestCase
  setup do
    @fraternity = fraternities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fraternities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fraternity" do
    assert_difference('Fraternity.count') do
      post :create, fraternity: {  }
    end

    assert_redirected_to fraternity_path(assigns(:fraternity))
  end

  test "should show fraternity" do
    get :show, id: @fraternity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fraternity
    assert_response :success
  end

  test "should update fraternity" do
    patch :update, id: @fraternity, fraternity: {  }
    assert_redirected_to fraternity_path(assigns(:fraternity))
  end

  test "should destroy fraternity" do
    assert_difference('Fraternity.count', -1) do
      delete :destroy, id: @fraternity
    end

    assert_redirected_to fraternities_path
  end
end
