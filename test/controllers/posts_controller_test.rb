require "test_helper"

class PostsControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers

    setup do
        @user = users(:user)
        sign_in @user
        @post = posts(:post)
    end

    teardown do
        # when controller is using cache it may be a good idea to reset it afterwards
        Rails.cache.clear
    end

    test "should get index posts" do
        get :index
        assert_response :success
    end

    test "should get new post" do
        get :new
        assert_response :success
    end

    test "should create a post" do
        assert_difference -> { Post.count }, 1 do
            post :create, params: { city: 'Warsaw', note: 'Test note'}.merge(current_user: @user.id)
        end
        assert_redirected_to posts_path
        assert_equal "Post created successfully", flash[:notice]
    end

    test "should edit the post" do
        get :edit, params: {id: @post.id}
        assert_response :success
    end

    test "should update the post" do
        patch :update, params: {id: @post.id, city: 'Łódź', note: 'Test note', commit: 'Save'}
        @post.reload
        assert_equal 'Łódź', @post.city
        assert_redirected_to posts_path
        assert_equal "Post updated successfully", flash[:notice]
    end

    test "should show the post" do
        get :show, params: {id: @post.id}
        assert_response :success
    end

    test "should destroy the post" do
        assert_difference -> { Post.count }, -1 do
            delete :destroy, params: { id: @post.id }
        end
        assert_redirected_to posts_path
        assert_equal "Post destroyed successfully", flash[:notice]
    end
end
