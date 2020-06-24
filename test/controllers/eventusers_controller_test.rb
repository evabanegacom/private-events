require 'test_helper'

class EventusersControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get eventusers_index_url
    assert_response :success
  end

  test 'should get show' do
    get eventusers_show_url
    assert_response :success
  end

  test 'should get new' do
    get eventusers_new_url
    assert_response :success
  end

  test 'should get create' do
    get eventusers_create_url
    assert_response :success
  end

  test 'should get edit' do
    get eventusers_edit_url
    assert_response :success
  end

  test 'should get update' do
    get eventusers_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get eventusers_destroy_url
    assert_response :success
  end
end
