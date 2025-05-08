require "test_helper"

class GruposControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get grupos_index_url
    assert_response :success
  end

  test "should get new" do
    get grupos_new_url
    assert_response :success
  end

  test "should get create" do
    get grupos_create_url
    assert_response :success
  end
end
