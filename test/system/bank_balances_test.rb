require "application_system_test_case"

class BankBalancesTest < ApplicationSystemTestCase
  setup do
    @bank_balance = bank_balances(:one)
  end

  test "visiting the index" do
    visit bank_balances_url
    assert_selector "h1", text: "Bank balances"
  end

  test "should create bank balance" do
    visit bank_balances_url
    click_on "New bank balance"

    fill_in "Balance cents", with: @bank_balance.balance_cents
    fill_in "Riding", with: @bank_balance.riding_id
    click_on "Create Bank balance"

    assert_text "Bank balance was successfully created"
    click_on "Back"
  end

  test "should update Bank balance" do
    visit bank_balance_url(@bank_balance)
    click_on "Edit this bank balance", match: :first

    fill_in "Balance cents", with: @bank_balance.balance_cents
    fill_in "Riding", with: @bank_balance.riding_id
    click_on "Update Bank balance"

    assert_text "Bank balance was successfully updated"
    click_on "Back"
  end

  test "should destroy Bank balance" do
    visit bank_balance_url(@bank_balance)
    click_on "Destroy this bank balance", match: :first

    assert_text "Bank balance was successfully destroyed"
  end
end
