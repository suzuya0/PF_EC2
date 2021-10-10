require 'test_helper'

class WantedItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get wanted_items_new_url
    assert_response :success
  end

  test "should get edit" do
    get wanted_items_edit_url
    assert_response :success
  end

  test "should get show" do
    get wanted_items_show_url
    assert_response :success
  end

end
