require "test_helper"

class ExternalReportsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @external_report = external_reports(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get external_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_external_report_url
    assert_response :success
  end

  test "should create external_report" do
    assert_difference("ExternalReport.count") do
      post external_reports_url, params: { external_report: { description_en: @external_report.description_en, description_fr: @external_report.description_fr, name_en: @external_report.name_en, name_fr: @external_report.name_fr } }
    end

    assert_redirected_to external_report_url(ExternalReport.last)
  end

  test "should show external_report" do
    get external_report_url(@external_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_external_report_url(@external_report)
    assert_response :success
  end

  test "should update external_report" do
    patch external_report_url(@external_report), params: { external_report: { description_en: @external_report.description_en, description_fr: @external_report.description_fr, name_en: @external_report.name_en, name_fr: @external_report.name_fr } }
    assert_redirected_to external_report_url(@external_report)
  end

  test "should destroy external_report" do
    assert_difference("ExternalReport.count", -1) do
      delete external_report_url(@external_report)
    end

    assert_redirected_to external_reports_url
  end
end
