require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get saldo" do
    get dashboard_saldo_url
    assert_response :success
  end
end
