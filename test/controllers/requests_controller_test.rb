require "test_helper"

class RequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get requests_index_url
    assert_response :success
  end

  test "should get edit" do
    get requests_edit_url
    assert_response :success
  end

  test "should get update" do
    get requests_update_url
    assert_response :success
  end
end
