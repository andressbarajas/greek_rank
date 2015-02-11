require 'test_helper'

class FraternityChapterControllerTest < ActionController::TestCase

  setup do
    @fraternity = Fraternity.create({ name: 'Sigma Nu', letters: 'ΣΝ'})
    @fraternity_chapter = fraternity_chapters(:one)
    @fraternity_chapter.fraternity = @fraternity
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
