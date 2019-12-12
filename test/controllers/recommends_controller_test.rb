require 'test_helper'

class RecommendsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get recommends_new_url
    assert_response :success
  end

end
