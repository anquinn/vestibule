require "application_system_test_case"

class ExternalReportsTest < ApplicationSystemTestCase
  setup do
    @external_report = external_reports(:one)
  end

  test "visiting the index" do
    visit external_reports_url
    assert_selector "h1", text: "External reports"
  end

  test "should create external report" do
    visit external_reports_url
    click_on "New external report"

    fill_in "Description en", with: @external_report.description_en
    fill_in "Description fr", with: @external_report.description_fr
    fill_in "Name en", with: @external_report.name_en
    fill_in "Name fr", with: @external_report.name_fr
    click_on "Create External report"

    assert_text "External report was successfully created"
    click_on "Back"
  end

  test "should update External report" do
    visit external_report_url(@external_report)
    click_on "Edit this external report", match: :first

    fill_in "Description en", with: @external_report.description_en
    fill_in "Description fr", with: @external_report.description_fr
    fill_in "Name en", with: @external_report.name_en
    fill_in "Name fr", with: @external_report.name_fr
    click_on "Update External report"

    assert_text "External report was successfully updated"
    click_on "Back"
  end

  test "should destroy External report" do
    visit external_report_url(@external_report)
    click_on "Destroy this external report", match: :first

    assert_text "External report was successfully destroyed"
  end
end
