require 'test_helper'

class Admin::ContributionsControllerTest < ActionDispatch::IntegrationTest
  test "should get delete" do
    get admin_contributions_delete_url
    assert_response :success
  end

end
