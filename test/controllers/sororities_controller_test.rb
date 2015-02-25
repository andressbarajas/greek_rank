require 'test_helper'

class SororitiesControllerTest < ActionController::TestCase
  setup do
    @sorority = sororities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sororities)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create sorority" do
    sign_in users(:one)
    assert_difference('Sorority.count') do
      post :create, sorority: { name: @sorority.name, letters: @sorority.letters }
    end

    assert_redirected_to sorority_path(assigns(:sorority))
  end

  test "should show sorority" do
    get :show, id: @sorority
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @sorority
    assert_response :success
  end

  test "should update sorority" do
    sign_in users(:one)
    patch :update, id: @sorority, sorority: { name: @sorority.name, letters: @sorority.letters  }
    assert_redirected_to sorority_path(assigns(:sorority))
  end

  test "should destroy sorority" do
    sign_in users(:one)
    assert_difference('Sorority.count', -1) do
      delete :destroy, id: @sorority
    end

    assert_redirected_to sororities_path
  end
end
