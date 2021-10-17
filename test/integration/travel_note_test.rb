require "test_helper"

class TravelNoteTest < ActionDispatch::IntegrationTest

    test "sign in and then sign out" do
        visit root_path
        click_link 'Sign in'
        fill_in "Email", with: "user1@example.org"
        fill_in "Password", with: "password"
        click_button "Log in"

        assert page.has_content?("Signed in successfully.")

        click_link 'Sign out'

        assert page.has_content?("Signed out successfully.")
    end

    test "sign in, change password, sign out and then sign in again with new password" do
        visit root_path
        click_link 'Sign in'
        fill_in "Email", with: "user1@example.org"
        fill_in "Password", with: "password"
        click_button "Log in"

        assert page.has_content?("Signed in successfully.")

        click_link 'Edit account'
        fill_in "Password", with: "password123"
        fill_in "Password confirmation", with: "password123"
        fill_in "Current password", with: "password"
        click_button "Update"

        assert page.has_content?("Your account has been updated successfully.")

        click_link 'Sign out'

        assert page.has_content?("Signed out successfully.")

        click_link 'Sign in'
        fill_in "Email", with: "user1@example.org"
        fill_in "Password", with: "password123"
        click_button "Log in"

        assert page.has_content?("Signed in successfully.")
    end

    test "sign in and go to the posts" do
        visit root_path
        click_link 'Sign in'
        fill_in "Email", with: "user1@example.org"
        fill_in "Password", with: "password"
        click_button "Log in"

        assert page.has_content?("Signed in successfully.")

        click_link 'Posts'
        assert page.has_content?("Older posts")
    end

    test "sign in and create a post" do
        visit root_path
        click_link 'Sign in'
        fill_in "Email", with: "user1@example.org"
        fill_in "Password", with: "password"
        click_button "Log in"

        assert page.has_content?("Signed in successfully.")

        click_link 'Posts'
        click_link 'Create new post'
        fill_in "City", with: "Łódź"
        fill_in "Note", with: "Test note from Łódź."
        click_button "Save"

        assert page.has_content?("Post created successfully")
        assert page.has_content?("Łódź")
        assert page.has_content?("Test note from Łódź.")
    end

    test "sign in and edit a post" do
        visit root_path
        click_link 'Sign in'
        fill_in "Email", with: "user1@example.org"
        fill_in "Password", with: "password"
        click_button "Log in"

        assert page.has_content?("Signed in successfully.")

        click_link 'Posts'

        assert page.has_content?("Warszawa")
        assert page.has_content?("Test note")

        click_link 'Edit'

        fill_in "City", with: "Łódź"
        fill_in "Note", with: "City has been changed."
        click_button "Save"

        assert page.has_content?("Post updated successfully")
        assert page.has_content?("Łódź")
        assert page.has_content?("City has been changed.")
    end

    test "sign in and show details a post" do
        visit root_path
        click_link 'Sign in'
        fill_in "Email", with: "user1@example.org"
        fill_in "Password", with: "password"
        click_button "Log in"
        click_link 'Posts'
        click_link 'Details'
        assert page.has_content?("Post details")
    end
end