require 'test_helper'

class ImportantPointsControllerTest < ActionController::TestCase
  setup do
    @important_point = important_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:important_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create important_point" do
    assert_difference('ImportantPoint.count') do
      post :create, important_point: { description: @important_point.description, title: @important_point.title }
    end

    assert_redirected_to important_point_path(assigns(:important_point))
  end

  test "should show important_point" do
    get :show, id: @important_point
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @important_point
    assert_response :success
  end

  test "should update important_point" do
    patch :update, id: @important_point, important_point: { description: @important_point.description, title: @important_point.title }
    assert_redirected_to important_point_path(assigns(:important_point))
  end

  test "should destroy important_point" do
    assert_difference('ImportantPoint.count', -1) do
      delete :destroy, id: @important_point
    end

    assert_redirected_to important_points_path
  end
end
