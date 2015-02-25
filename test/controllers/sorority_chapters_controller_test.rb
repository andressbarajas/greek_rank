require 'test_helper'

class SororityChaptersControllerTest < ActionController::TestCase

  setup do
    @sorority = sororities(:one)
    @sorority_chapter = sorority_chapters(:one)
    @sorority_chapter.sorority = @sorority
    @sorority_chapter.university = universities(:one)
    @sorority_chapter.save
  end

  test "should get show" do
    get :show, id: @sorority_chapter
    assert_response :success
  end
end
