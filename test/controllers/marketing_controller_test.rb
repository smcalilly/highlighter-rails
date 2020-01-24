require 'test_helper'

class MarketingControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get marketing_Index_url
    assert_response :success
  end

end
