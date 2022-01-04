require "test_helper"

class FoReportControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get fo_report_show_url
    assert_response :success
  end
end
