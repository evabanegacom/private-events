require 'test_helper'

class EventsusersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eventsuser = eventsusers(:one)
  end

  test 'should get index' do
    get eventsusers_url
    assert_response :success
  end

  test 'should get new' do
    get new_eventsuser_url
    assert_response :success
  end

  test 'should create eventsuser' do
    assert_difference('Eventsuser.count') do
      post eventsusers_url, params: { eventsuser: {} }
    end

    assert_redirected_to eventsuser_url(Eventsuser.last)
  end

  test 'should show eventsuser' do
    get eventsuser_url(@eventsuser)
    assert_response :success
  end

  test 'should get edit' do
    get edit_eventsuser_url(@eventsuser)
    assert_response :success
  end

  test 'should update eventsuser' do
    patch eventsuser_url(@eventsuser), params: { eventsuser: {} }
    assert_redirected_to eventsuser_url(@eventsuser)
  end

  test 'should destroy eventsuser' do
    assert_difference('Eventsuser.count', -1) do
      delete eventsuser_url(@eventsuser)
    end

    assert_redirected_to eventsusers_url
  end
end
