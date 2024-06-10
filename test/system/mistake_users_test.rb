require "application_system_test_case"

class MistakeUsersTest < ApplicationSystemTestCase
  setup do
    @mistake_user = mistake_users(:one)
  end

  test "visiting the index" do
    visit mistake_users_url
    assert_selector "h1", text: "Mistake users"
  end

  test "should create mistake user" do
    visit mistake_users_url
    click_on "New mistake user"

    click_on "Create Mistake user"

    assert_text "Mistake user was successfully created"
    click_on "Back"
  end

  test "should update Mistake user" do
    visit mistake_user_url(@mistake_user)
    click_on "Edit this mistake user", match: :first

    click_on "Update Mistake user"

    assert_text "Mistake user was successfully updated"
    click_on "Back"
  end

  test "should destroy Mistake user" do
    visit mistake_user_url(@mistake_user)
    click_on "Destroy this mistake user", match: :first

    assert_text "Mistake user was successfully destroyed"
  end
end
