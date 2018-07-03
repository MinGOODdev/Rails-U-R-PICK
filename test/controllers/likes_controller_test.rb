require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get likes" do
    get likes_likes_url
    assert_response :success
  end

  test "should get dislikes" do
    get likes_dislikes_url
    assert_response :success
  end

end
