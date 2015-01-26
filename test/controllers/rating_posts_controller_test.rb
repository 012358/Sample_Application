require 'test_helper'

class RatingPostsControllerTest < ActionController::TestCase
  setup do
    @rating_post = rating_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rating_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rating_post" do
    assert_difference('RatingPost.count') do
      post :create, rating_post: { title: @rating_post.title }
    end

    assert_redirected_to rating_post_path(assigns(:rating_post))
  end

  test "should show rating_post" do
    get :show, id: @rating_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rating_post
    assert_response :success
  end

  test "should update rating_post" do
    patch :update, id: @rating_post, rating_post: { title: @rating_post.title }
    assert_redirected_to rating_post_path(assigns(:rating_post))
  end

  test "should destroy rating_post" do
    assert_difference('RatingPost.count', -1) do
      delete :destroy, id: @rating_post
    end

    assert_redirected_to rating_posts_path
  end
end
