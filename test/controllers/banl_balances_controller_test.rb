require "test_helper"

class BanlBalancesControllerTest < ActionDispatch::IntegrationTest
  test "should get Controller" do
    get banl_balances_Controller_url
    assert_response :success
  end

  test "should get index" do
    get banl_balances_index_url
    assert_response :success
  end

  test "should get new" do
    get banl_balances_new_url
    assert_response :success
  end

  test "should get create" do
    get banl_balances_create_url
    assert_response :success
  end
end
