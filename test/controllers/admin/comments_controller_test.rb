require 'test_helper'

class Admin::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get delete" do
    get admin_comments_delete_url
    assert_response :success
  end

end
