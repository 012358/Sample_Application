require 'test_helper'

class RatingUsersControllerTest < ActionController::TestCase
  setup do
    @rating_user = rating_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rating_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rating_user" do
    assert_difference('RatingUser.count') do
      post :create, rating_user: { name: @rating_user.name }
    end

    assert_redirected_to rating_user_path(assigns(:rating_user))
  end

  test "should show rating_user" do
    get :show, id: @rating_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rating_user
    assert_response :success
  end

  test "should update rating_user" do
    patch :update, id: @rating_user, rating_user: { name: @rating_user.name }
    assert_redirected_to rating_user_path(assigns(:rating_user))
  end

  test "should destroy rating_user" do
    assert_difference('RatingUser.count', -1) do
      delete :destroy, id: @rating_user
    end

    assert_redirected_to rating_users_path
  end
end
