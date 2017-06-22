require 'test_helper'

class FriendSupportsControllerTest < ActionController::TestCase
  setup do
    @friend_support = friend_supports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:friend_supports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create friend_support" do
    assert_difference('FriendSupport.count') do
      post :create, friend_support: { coordinate_x: @friend_support.coordinate_x, coordinate_y: @friend_support.coordinate_y }
    end

    assert_redirected_to friend_support_path(assigns(:friend_support))
  end

  test "should show friend_support" do
    get :show, id: @friend_support
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @friend_support
    assert_response :success
  end

  test "should update friend_support" do
    patch :update, id: @friend_support, friend_support: { coordinate_x: @friend_support.coordinate_x, coordinate_y: @friend_support.coordinate_y }
    assert_redirected_to friend_support_path(assigns(:friend_support))
  end

  test "should destroy friend_support" do
    assert_difference('FriendSupport.count', -1) do
      delete :destroy, id: @friend_support
    end

    assert_redirected_to friend_supports_path
  end
end
