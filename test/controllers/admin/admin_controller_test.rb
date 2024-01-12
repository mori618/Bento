require "test_helper"

class Admin::AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_admin_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_admin_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_admin_edit_url
    assert_response :success
  end

  test "should get new" do
    get admin_admin_new_url
    assert_response :success
  end
end
