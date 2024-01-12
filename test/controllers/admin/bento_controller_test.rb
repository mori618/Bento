require "test_helper"

class Admin::BentoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_bento_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_bento_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_bento_edit_url
    assert_response :success
  end

  test "should get new" do
    get admin_bento_new_url
    assert_response :success
  end
end
