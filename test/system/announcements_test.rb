require "application_system_test_case"

class AnnouncementsTest < ApplicationSystemTestCase
  setup do
    @announcement = announcements(:one)
  end

  test "visiting the index" do
    visit announcements_url
    assert_selector "h1", text: "Announcements"
  end

  test "should create announcement" do
    visit announcements_url
    click_on "New announcement"

    fill_in "Body en", with: @announcement.body_en
    fill_in "Body fr", with: @announcement.body_fr
    fill_in "Title en", with: @announcement.title_en
    fill_in "Title fr", with: @announcement.title_fr
    click_on "Create Announcement"

    assert_text "Announcement was successfully created"
    click_on "Back"
  end

  test "should update Announcement" do
    visit announcement_url(@announcement)
    click_on "Edit this announcement", match: :first

    fill_in "Body en", with: @announcement.body_en
    fill_in "Body fr", with: @announcement.body_fr
    fill_in "Title en", with: @announcement.title_en
    fill_in "Title fr", with: @announcement.title_fr
    click_on "Update Announcement"

    assert_text "Announcement was successfully updated"
    click_on "Back"
  end

  test "should destroy Announcement" do
    visit announcement_url(@announcement)
    click_on "Destroy this announcement", match: :first

    assert_text "Announcement was successfully destroyed"
  end
end