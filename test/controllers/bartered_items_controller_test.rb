require 'test_helper'

class BarteredItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bartered_items_new_url
    assert_response :success
  end

  test "should get edit" do
    get bartered_items_edit_url
    assert_response :success
  end

  test "should get index" do
    get bartered_items_index_url
    assert_response :success
  end

  test "should get show" do
    get bartered_items_show_url
    assert_response :success
  end

end
