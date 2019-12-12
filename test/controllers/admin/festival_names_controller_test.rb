require 'test_helper'

class Admin::FestivalNamesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_festival_names_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_festival_names_edit_url
    assert_response :success
  end

end
