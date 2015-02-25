require 'test_helper'

class RatingsControllerTest < ActionController::TestCase

  setup do
    @rating = ratings(:one)
    @chapter = fraternity_chapters(:one)
  end

  test "should get create" do
    assert_difference('Rating.count') do
      post :create, fraternity_chapter_id: @chapter.id, rating: { nick_name: "MyString",
                              message: "MyString",
                              looks: 1.5,
                              popularity: 1.5,
                              classiness: 1.5,
                              involvement: 1.5,
                              socialness: 1.5,
                              brotherhood: 1.5,
                              chapter_id: @chapter.id,
                              chapter_type: @chapter.class.name }
    end

    assert_redirected_to assigns(:rating).chapter
  end
end
