require "test_helper"

class Publics::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get publics_genres_show_url
    assert_response :success
  end
end
