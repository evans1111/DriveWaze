require "application_system_test_case"

class UserCreatesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit user_creates_url
  #
  #   assert_selector "h1", text: "UserCreate"
  # end

  test "index and create user" do
    # visit the users index page
    visit new_user_registration

    # # click on the "New User" link
    # click_link "New User"
    #
    # # fill out the form (name, email)
    fill_in "user[email]", with: "asdf@asdf.com"
    # fill_in "Email", with: "test@example.com"
    #
    # # click the "Create User" button
    # click_button "Create User"
    #
    # # confirm your name, email
    # # confirm flash message: "User was successfully created"
    # assert page.has_content?("User was successfully created")
    # assert page.has_content?("Test")
    # assert page.has_content?("test@example.com")
    #
    # # click on the "Back"
    # click_link "Back"
    #
    # # confirm that your name, email appear in the index
    # assert page.has_content?("Test")
    # assert page.has_content?("test@example.com")
  end
end
