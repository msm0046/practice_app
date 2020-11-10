require 'test_helper'

class ListOfNamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get list_of_names_index_url
    assert_response :success
  end

end
