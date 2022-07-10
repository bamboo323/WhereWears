require "test_helper"

class Publics::ShopCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get publics_shop_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get publics_shop_comments_destroy_url
    assert_response :success
  end
end
