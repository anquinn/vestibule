require "test_helper"

class BankBalancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bank_balance = bank_balances(:one)
  end

  test "should get index" do
    get bank_balances_url
    assert_response :success
  end

  test "should get new" do
    get new_bank_balance_url
    assert_response :success
  end

  test "should create bank_balance" do
    assert_difference("BankBalance.count") do
      post bank_balances_url, params: { bank_balance: { balance_cents: @bank_balance.balance_cents, riding_id: @bank_balance.riding_id } }
    end

    assert_redirected_to bank_balance_url(BankBalance.last)
  end

  test "should show bank_balance" do
    get bank_balance_url(@bank_balance)
    assert_response :success
  end

  test "should get edit" do
    get edit_bank_balance_url(@bank_balance)
    assert_response :success
  end

  test "should update bank_balance" do
    patch bank_balance_url(@bank_balance), params: { bank_balance: { balance_cents: @bank_balance.balance_cents, riding_id: @bank_balance.riding_id } }
    assert_redirected_to bank_balance_url(@bank_balance)
  end

  test "should destroy bank_balance" do
    assert_difference("BankBalance.count", -1) do
      delete bank_balance_url(@bank_balance)
    end

    assert_redirected_to bank_balances_url
  end
end
