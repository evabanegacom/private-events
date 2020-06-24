require 'rails_helper'

RSpec.describe SessionsController, type: :feature do
  before :each do
    User.create(username: 'Precious', password: 'precious', email: 'precious@yahoo.com')
  end

  it 'Logs in and redirects the user to the show of their page ' do
    visit '/sessions/new'
    fill_in 'email', with: 'precious@yahoo.com'
    fill_in 'password', with: 'precious'
    click_button 'Login'
    expect(page).to have_content 'upcoming events'
  end

  it 'Logs in and shows event creation form ' do
    visit '/sessions/new'
    fill_in 'email', with: 'precious@yahoo.com'
    fill_in 'password', with: 'precious'
    click_button 'Login'
    expect(page).to have_content 'create an event'
  end

  it 'loggin in with wrong credentials' do
    visit '/sessions/new'
    fill_in 'email', with: 'p@yahoo.com'
    fill_in 'password', with: 'precious'
    click_button 'Login'
    sleep(1)
    expect(page).to have_content 'Email or password is invalid'
  end

  it 'Logs out, redirects to login page' do
    visit '/sessions/new'
    fill_in 'email', with: 'precious@yahoo.com'
    fill_in 'password', with: 'precious'
    click_button 'Login'
    sleep(1)
    click_link 'Log Out'
    sleep(2)
    expect(page).to have_content 'Sign Up or Log In'
  end
end
