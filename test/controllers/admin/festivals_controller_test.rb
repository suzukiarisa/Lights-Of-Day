require 'test_helper'

class Admin::FestivalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_festivals_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_festivals_edit_url
    assert_response :success
  end

end
