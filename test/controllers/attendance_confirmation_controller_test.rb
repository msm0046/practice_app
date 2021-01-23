require 'test_helper'

class AttendanceConfirmationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get attendance_confirmation_index_url
    assert_response :success
  end

end
