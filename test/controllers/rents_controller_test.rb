require 'test_helper'

class RentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rents_index_url
    assert_response :success
  end

end
