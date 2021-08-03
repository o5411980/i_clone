require 'test_helper'

class ProfileImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile_image = profile_images(:one)
  end

  test "should get index" do
    get profile_images_url
    assert_response :success
  end

  test "should get new" do
    get new_profile_image_url
    assert_response :success
  end

  test "should create profile_image" do
    assert_difference('ProfileImage.count') do
      post profile_images_url, params: { profile_image: { profile_image: @profile_image.profile_image } }
    end

    assert_redirected_to profile_image_url(ProfileImage.last)
  end

  test "should show profile_image" do
    get profile_image_url(@profile_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_image_url(@profile_image)
    assert_response :success
  end

  test "should update profile_image" do
    patch profile_image_url(@profile_image), params: { profile_image: { profile_image: @profile_image.profile_image } }
    assert_redirected_to profile_image_url(@profile_image)
  end

  test "should destroy profile_image" do
    assert_difference('ProfileImage.count', -1) do
      delete profile_image_url(@profile_image)
    end

    assert_redirected_to profile_images_url
  end
end
