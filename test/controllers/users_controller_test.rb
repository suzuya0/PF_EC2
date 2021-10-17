require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_index_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get delete" do
    get users_delete_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get barter" do
    get users_barter_url
    assert_response :success
  end

  test "should get want" do
    get users_want_url
    assert_response :success
  end

  test "should get bookmark" do
    get users_bookmark_url
    assert_response :success
  end

end
