require 'test_helper'

class SpotControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spot_index_url
    assert_response :success
  end

  test "should get new" do
    get spot_new_url
    assert_response :success
  end

  test "should get create" do
    get spot_create_url
    assert_response :success
  end

  test "should get listing" do
    get spot_listing_url
    assert_response :success
  end

  test "should get pricing" do
    get spot_pricing_url
    assert_response :success
  end

  test "should get description" do
    get spot_description_url
    assert_response :success
  end

  test "should get photo_upload" do
    get spot_photo_upload_url
    assert_response :success
  end

  test "should get location" do
    get spot_location_url
    assert_response :success
  end

  test "should get update" do
    get spot_update_url
    assert_response :success
  end

end
