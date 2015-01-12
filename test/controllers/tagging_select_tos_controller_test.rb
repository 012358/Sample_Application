require 'test_helper'

class TaggingSelectTosControllerTest < ActionController::TestCase
  setup do
    @tagging_select_to = tagging_select_tos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tagging_select_tos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tagging_select_to" do
    assert_difference('TaggingSelectTo.count') do
      post :create, tagging_select_to: { name: @tagging_select_to.name }
    end

    assert_redirected_to tagging_select_to_path(assigns(:tagging_select_to))
  end

  test "should show tagging_select_to" do
    get :show, id: @tagging_select_to
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tagging_select_to
    assert_response :success
  end

  test "should update tagging_select_to" do
    patch :update, id: @tagging_select_to, tagging_select_to: { name: @tagging_select_to.name }
    assert_redirected_to tagging_select_to_path(assigns(:tagging_select_to))
  end

  test "should destroy tagging_select_to" do
    assert_difference('TaggingSelectTo.count', -1) do
      delete :destroy, id: @tagging_select_to
    end

    assert_redirected_to tagging_select_tos_path
  end
end
