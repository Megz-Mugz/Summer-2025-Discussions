require "test_helper"

class MistakeUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mistake_user = mistake_users(:one)
  end

  test "should get index" do
    get mistake_users_url
    assert_response :success
  end

  test "should get new" do
    get new_mistake_user_url
    assert_response :success
  end

  test "should create mistake_user" do
    assert_difference("MistakeUser.count") do
      post mistake_users_url, params: { mistake_user: {  } }
    end

    assert_redirected_to mistake_user_url(MistakeUser.last)
  end

  test "should show mistake_user" do
    get mistake_user_url(@mistake_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_mistake_user_url(@mistake_user)
    assert_response :success
  end

  test "should update mistake_user" do
    patch mistake_user_url(@mistake_user), params: { mistake_user: {  } }
    assert_redirected_to mistake_user_url(@mistake_user)
  end

  test "should destroy mistake_user" do
    assert_difference("MistakeUser.count", -1) do
      delete mistake_user_url(@mistake_user)
    end

    assert_redirected_to mistake_users_url
  end
end
