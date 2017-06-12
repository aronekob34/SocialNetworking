require 'test_helper'

class LocationImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_image = location_images(:one)
  end

  test "should get index" do
    get location_images_url
    assert_response :success
  end

  test "should get new" do
    get new_location_image_url
    assert_response :success
  end

  test "should create location_image" do
    assert_difference('LocationImage.count') do
      post location_images_url, params: { location_image: { houseimages: @location_image.houseimages, location_id: @location_image.location_id } }
    end

    assert_redirected_to location_image_url(LocationImage.last)
  end

  test "should show location_image" do
    get location_image_url(@location_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_image_url(@location_image)
    assert_response :success
  end

  test "should update location_image" do
    patch location_image_url(@location_image), params: { location_image: { houseimages: @location_image.houseimages, location_id: @location_image.location_id } }
    assert_redirected_to location_image_url(@location_image)
  end

  test "should destroy location_image" do
    assert_difference('LocationImage.count', -1) do
      delete location_image_url(@location_image)
    end

    assert_redirected_to location_images_url
  end
end
