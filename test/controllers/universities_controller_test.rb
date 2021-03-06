require 'test_helper'

class UniversitiesControllerTest < ActionController::TestCase
  setup do
    @university = universities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:universities)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create university" do
    sign_in users(:one)
    assert_difference('University.count') do
      post :create, university: { name: @university.name, initials: @university.initials }
    end

    assert_redirected_to university_path(assigns(:university))
  end

  test "should show university" do
    get :show, id: @university
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @university
    assert_response :success
  end

  test "should update university" do
    sign_in users(:one)
    patch :update, id: @university, university: { name: @university.name, initials: @university.initials }
    assert_redirected_to university_path(assigns(:university))
  end

  test "should destroy university" do
    sign_in users(:one)
    assert_difference('University.count', -1) do
      delete :destroy, id: @university
    end

    assert_redirected_to universities_path
  end
end
