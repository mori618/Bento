require "test_helper"

class Public::DishesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_dishes_index_url
    assert_response :success
  end

  test "should get show" do
    get public_dishes_show_url
    assert_response :success
  end
end
