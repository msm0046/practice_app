require 'test_helper'

class FiftyCharacterTableControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fifty_character_table_index_url
    assert_response :success
  end

end
