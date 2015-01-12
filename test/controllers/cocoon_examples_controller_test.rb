require 'test_helper'

class CocoonExamplesControllerTest < ActionController::TestCase
  setup do
    @cocoon_example = cocoon_examples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cocoon_examples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cocoon_example" do
    assert_difference('CocoonExample.count') do
      post :create, cocoon_example: { name: @cocoon_example.name }
    end

    assert_redirected_to cocoon_example_path(assigns(:cocoon_example))
  end

  test "should show cocoon_example" do
    get :show, id: @cocoon_example
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cocoon_example
    assert_response :success
  end

  test "should update cocoon_example" do
    patch :update, id: @cocoon_example, cocoon_example: { name: @cocoon_example.name }
    assert_redirected_to cocoon_example_path(assigns(:cocoon_example))
  end

  test "should destroy cocoon_example" do
    assert_difference('CocoonExample.count', -1) do
      delete :destroy, id: @cocoon_example
    end

    assert_redirected_to cocoon_examples_path
  end
end
