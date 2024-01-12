require "test_helper"

class Public::BentoBoxControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_bento_box_index_url
    assert_response :success
  end

  test "should get show" do
    get public_bento_box_show_url
    assert_response :success
  end
end
