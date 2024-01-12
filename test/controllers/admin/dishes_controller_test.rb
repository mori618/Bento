require "test_helper"

class Admin::DishesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_dishes_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_dishes_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_dishes_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_dishes_edit_url
    assert_response :success
  end
end
