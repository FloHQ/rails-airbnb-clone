require 'test_helper'

class NannyOffersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nanny_offers_index_url
    assert_response :success
  end

  test "should get create" do
    get nanny_offers_create_url
    assert_response :success
  end

  test "should get new" do
    get nanny_offers_new_url
    assert_response :success
  end

  test "should get edit" do
    get nanny_offers_edit_url
    assert_response :success
  end

  test "should get show" do
    get nanny_offers_show_url
    assert_response :success
  end

  test "should get update" do
    get nanny_offers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get nanny_offers_destroy_url
    assert_response :success
  end

end
