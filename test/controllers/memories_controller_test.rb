require 'test_helper'

class MemoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get memories_new_url
    assert_response :success
  end

end
