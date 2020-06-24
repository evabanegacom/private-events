require 'rails_helper'

RSpec.describe EventsController, type: :feature do
  before :each do
    User.create(username: 'Precious', password: 'precious', email: 'precious@yahoo.com')
    visit '/sessions/new'
    fill_in 'email', with: 'precious@yahoo.com'
    fill_in 'password', with: 'precious'
    click_button 'Login'
  end

  it 'event must have dates' do
    visit '/events/new'
    fill_in 'Event', with: 'birthday'
    fill_in 'Description', with: 'celebration'
    # fill_in 'event_date', with: "2014-01-01"
    click_button 'Create Event'
    expect(page).to have_content('cant create a past date event')
  end
end
