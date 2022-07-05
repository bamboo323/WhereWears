require "test_helper"

class Publics::ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get publics_shops_new_url
    assert_response :success
  end

  test "should get create" do
    get publics_shops_create_url
    assert_response :success
  end

  test "should get index" do
    get publics_shops_index_url
    assert_response :success
  end

  test "should get show" do
    get publics_shops_show_url
    assert_response :success
  end

  test "should get edit" do
    get publics_shops_edit_url
    assert_response :success
  end

  test "should get update" do
    get publics_shops_update_url
    assert_response :success
  end

  test "should get destroy" do
    get publics_shops_destroy_url
    assert_response :success
  end
end
