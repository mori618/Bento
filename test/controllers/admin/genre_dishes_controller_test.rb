require "test_helper"

class Admin::GenreDishesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_genre_dishes_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_genre_dishes_edit_url
    assert_response :success
  end
end
