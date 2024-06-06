require "application_system_test_case"

class MistakesTest < ApplicationSystemTestCase
  setup do
    @mistake = mistakes(:one)
  end

  test "visiting the index" do
    visit mistakes_url
    assert_selector "h1", text: "Mistakes"
  end

  test "should create mistake" do
    visit mistakes_url
    click_on "New mistake"

    click_on "Create Mistake"

    assert_text "Mistake was successfully created"
    click_on "Back"
  end

  test "should update Mistake" do
    visit mistake_url(@mistake)
    click_on "Edit this mistake", match: :first

    click_on "Update Mistake"

    assert_text "Mistake was successfully updated"
    click_on "Back"
  end

  test "should destroy Mistake" do
    visit mistake_url(@mistake)
    click_on "Destroy this mistake", match: :first

    assert_text "Mistake was successfully destroyed"
  end
end
