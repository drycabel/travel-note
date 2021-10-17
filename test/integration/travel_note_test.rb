require "test_helper"

class TravelNoteTest < ActionDispatch::IntegrationTest
    include Devise::Test::ControllerHelpers

    # setup do
    #     @user = users(:user)
    #     sign_in @user
    # end

    # test "sign in" do
    #     click_button "Sign in"
    #     fill_in "Email", with: "user1@example.org"
    #     fill_in "Password", with: "password"
    #     click_button "Log in"

    #     assert page.has_content?("Signed in successfully.")
    # end

    # test "create post" do
    #     visit posts_path
    #     # click_button "Posts"
    #     click_button "Create new post"
    #     # fill_in "Email", with: "user1@example.org"
    #     # fill_in "Password", with: "password"
    #     # click_button "Log in"

    #     # assert page.has_content?("Signed in successfully.")
    # end
end