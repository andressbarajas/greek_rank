require 'test_helper'

class FraternityChaptersControllerTest < ActionController::TestCase

  setup do
    @fraternity = fraternities(:one)
    @fraternity_chapter = fraternity_chapters(:one)
    @fraternity_chapter.fraternity = @fraternity
    @fraternity_chapter.university = universities(:one)
    @fraternity_chapter.save
  end

  test "should get show" do
    get :show, id: @fraternity_chapter
    assert_response :success
  end

end
