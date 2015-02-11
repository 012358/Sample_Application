require 'test_helper'

class OrganizeDataControllerTest < ActionController::TestCase
  setup do
    @organize_datum = organize_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organize_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organize_datum" do
    assert_difference('OrganizeDatum.count') do
      post :create, organize_datum: { name: @organize_datum.name, parentId: @organize_datum.parentId, title: @organize_datum.title }
    end

    assert_redirected_to organize_datum_path(assigns(:organize_datum))
  end

  test "should show organize_datum" do
    get :show, id: @organize_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organize_datum
    assert_response :success
  end

  test "should update organize_datum" do
    patch :update, id: @organize_datum, organize_datum: { name: @organize_datum.name, parentId: @organize_datum.parentId, title: @organize_datum.title }
    assert_redirected_to organize_datum_path(assigns(:organize_datum))
  end

  test "should destroy organize_datum" do
    assert_difference('OrganizeDatum.count', -1) do
      delete :destroy, id: @organize_datum
    end

    assert_redirected_to organize_data_path
  end
end
