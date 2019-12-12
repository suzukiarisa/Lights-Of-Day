require 'test_helper'

class FestivalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get festivals_index_url
    assert_response :success
  end

end
