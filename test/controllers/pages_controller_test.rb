require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get carrito" do
    get pages_carrito_url
    assert_response :success
  end
end
