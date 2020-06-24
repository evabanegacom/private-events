require 'application_system_test_case'

class EventsusersTest < ApplicationSystemTestCase
  setup do
    @eventsuser = eventsusers(:one)
  end

  test 'visiting the index' do
    visit eventsusers_url
    assert_selector 'h1', text: 'Eventsusers'
  end

  test 'creating a Eventsuser' do
    visit eventsusers_url
    click_on 'New Eventsuser'

    click_on 'Create Eventsuser'

    assert_text 'Eventsuser was successfully created'
    click_on 'Back'
  end

  test 'updating a Eventsuser' do
    visit eventsusers_url
    click_on 'Edit', match: :first

    click_on 'Update Eventsuser'

    assert_text 'Eventsuser was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Eventsuser' do
    visit eventsusers_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Eventsuser was successfully destroyed'
  end
end
