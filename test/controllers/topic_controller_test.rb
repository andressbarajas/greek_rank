require 'test_helper'

class TopicControllerTest < ActionController::TestCase
  setup do
    @topic = topics(:one)
    @university = universities(:one)
    @topic.university = @university
    @topic.save
  end

  test "should get show" do
    get :show, id: @topic
    assert_response :success
  end

  test "should get create" do
    assert_difference('Topic.count') do
      post :create, university_id: @university.id, topic: { nick_name: "John Doe", subject: "Best Sorority", message: "Who is it" }
    end
    assert_redirected_to topic_path(assigns(:topic))
  end
end
