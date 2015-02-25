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
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create fraternity" do
    sign_in users(:one)
    assert_difference('Fraternity.count') do
      post :create, fraternity: { name: "Fake", letters: "F" }
    end

    assert_redirected_to fraternity_path(assigns(:fraternity))
  end

  test "should show fraternity" do
    get :show, id: @fraternity
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @fraternity
    assert_response :success
  end

  test "should update fraternity" do
    sign_in users(:one)
    patch :update, id: @fraternity, fraternity: { name: @fraternity.name, letters: @fraternity.letters }
    assert_redirected_to fraternity_path(assigns(:fraternity))
  end

  test "should destroy fraternity" do
    sign_in users(:one)
    assert_difference('Fraternity.count', -1) do
      delete :destroy, id: @fraternity
    end

    assert_redirected_to fraternities_path
  end
end
