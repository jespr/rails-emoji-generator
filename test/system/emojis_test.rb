require "application_system_test_case"

class EmojisTest < ApplicationSystemTestCase
  setup do
    @emoji = emojis(:one)
  end

  test "visiting the index" do
    visit emojis_url
    assert_selector "h1", text: "Emojis"
  end

  test "should create emoji" do
    visit emojis_url
    click_on "New emoji"

    click_on "Create Emoji"

    assert_text "Emoji was successfully created"
    click_on "Back"
  end

  test "should update Emoji" do
    visit emoji_url(@emoji)
    click_on "Edit this emoji", match: :first

    click_on "Update Emoji"

    assert_text "Emoji was successfully updated"
    click_on "Back"
  end

  test "should destroy Emoji" do
    visit emoji_url(@emoji)
    click_on "Destroy this emoji", match: :first

    assert_text "Emoji was successfully destroyed"
  end
end
