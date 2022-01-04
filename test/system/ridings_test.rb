require "application_system_test_case"

class RidingsTest < ApplicationSystemTestCase
  setup do
    @riding = ridings(:one)
  end

  test "visiting the index" do
    visit ridings_url
    assert_selector "h1", text: "Ridings"
  end

  test "should create riding" do
    visit ridings_url
    click_on "New riding"

    fill_in "Member affiliation en", with: @riding.member_affiliation_en
    fill_in "Member affiliation fr", with: @riding.member_affiliation_fr
    fill_in "Member name en", with: @riding.member_name_en
    fill_in "Member name fr", with: @riding.member_name_fr
    fill_in "Name en", with: @riding.name_en
    fill_in "Name fr", with: @riding.name_fr
    fill_in "Province en", with: @riding.province_en
    fill_in "Province fr", with: @riding.province_fr
    fill_in "Region en", with: @riding.region_en
    fill_in "Region fr", with: @riding.region_fr
    fill_in "Riding code", with: @riding.riding_code
    fill_in "Riding type en", with: @riding.riding_type_en
    fill_in "Riding type fr", with: @riding.riding_type_fr
    click_on "Create Riding"

    assert_text "Riding was successfully created"
    click_on "Back"
  end

  test "should update Riding" do
    visit riding_url(@riding)
    click_on "Edit this riding", match: :first

    fill_in "Member affiliation en", with: @riding.member_affiliation_en
    fill_in "Member affiliation fr", with: @riding.member_affiliation_fr
    fill_in "Member name en", with: @riding.member_name_en
    fill_in "Member name fr", with: @riding.member_name_fr
    fill_in "Name en", with: @riding.name_en
    fill_in "Name fr", with: @riding.name_fr
    fill_in "Province en", with: @riding.province_en
    fill_in "Province fr", with: @riding.province_fr
    fill_in "Region en", with: @riding.region_en
    fill_in "Region fr", with: @riding.region_fr
    fill_in "Riding code", with: @riding.riding_code
    fill_in "Riding type en", with: @riding.riding_type_en
    fill_in "Riding type fr", with: @riding.riding_type_fr
    click_on "Update Riding"

    assert_text "Riding was successfully updated"
    click_on "Back"
  end

  test "should destroy Riding" do
    visit riding_url(@riding)
    click_on "Destroy this riding", match: :first

    assert_text "Riding was successfully destroyed"
  end
end
