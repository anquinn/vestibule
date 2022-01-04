require "test_helper"

class RidingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @riding = ridings(:one)
    @user = users(:one)
    sign_in @user
  end

  # test "should get index" do
  #   get ridings_url
  #   assert_response :success
  # end

  test "should get new" do
    get new_riding_url
    assert_response :success
  end

  test "should create riding" do
    assert_difference("Riding.count") do
      post ridings_url, params: { riding: { member_affiliation_en: @riding.member_affiliation_en, member_affiliation_fr: @riding.member_affiliation_fr, member_name_en: @riding.member_name_en, member_name_fr: @riding.member_name_fr, name_en: @riding.name_en, name_fr: @riding.name_fr, province_en: @riding.province_en, province_fr: @riding.province_fr, region_en: @riding.region_en, region_fr: @riding.region_fr, riding_code: @riding.riding_code, riding_type_en: @riding.riding_type_en, riding_type_fr: @riding.riding_type_fr } }
    end

    assert_redirected_to riding_url(Riding.last)
  end

  test "should show riding" do
    get riding_url(@riding)
    assert_response :success
  end

  test "should get edit" do
    get edit_riding_url(@riding)
    assert_response :success
  end

  test "should update riding" do
    patch riding_url(@riding), params: { riding: { member_affiliation_en: @riding.member_affiliation_en, member_affiliation_fr: @riding.member_affiliation_fr, member_name_en: @riding.member_name_en, member_name_fr: @riding.member_name_fr, name_en: @riding.name_en, name_fr: @riding.name_fr, province_en: @riding.province_en, province_fr: @riding.province_fr, region_en: @riding.region_en, region_fr: @riding.region_fr, riding_code: @riding.riding_code, riding_type_en: @riding.riding_type_en, riding_type_fr: @riding.riding_type_fr } }
    assert_redirected_to riding_url(@riding)
  end

  test "should destroy riding" do
    assert_difference("Riding.count", -1) do
      delete riding_url(@riding)
    end

    assert_redirected_to ridings_url
  end
end
