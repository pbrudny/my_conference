require 'test_helper'

class WaitingUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @waiting_user = waiting_users(:one)
  end

  test "should get index" do
    get waiting_users_url
    assert_response :success
  end

  test "should get new" do
    get new_waiting_user_url
    assert_response :success
  end

  test "should create waiting_user" do
    assert_difference('WaitingUser.count') do
      post waiting_users_url, params: { waiting_user: { category_id: @waiting_user.category_id, city: @waiting_user.city, email: @waiting_user.email, fellowship: @waiting_user.fellowship, first_name: @waiting_user.first_name, last_name: @waiting_user.last_name, phone: @waiting_user.phone } }
    end

    assert_redirected_to waiting_user_url(WaitingUser.last)
  end

  test "should show waiting_user" do
    get waiting_user_url(@waiting_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_waiting_user_url(@waiting_user)
    assert_response :success
  end

  test "should update waiting_user" do
    patch waiting_user_url(@waiting_user), params: { waiting_user: { category_id: @waiting_user.category_id, city: @waiting_user.city, email: @waiting_user.email, fellowship: @waiting_user.fellowship, first_name: @waiting_user.first_name, last_name: @waiting_user.last_name, phone: @waiting_user.phone } }
    assert_redirected_to waiting_user_url(@waiting_user)
  end

  test "should destroy waiting_user" do
    assert_difference('WaitingUser.count', -1) do
      delete waiting_user_url(@waiting_user)
    end

    assert_redirected_to waiting_users_url
  end
end
