require 'rails_helper'

RSpec.describe UsersController, type: :feature do
  before :each do
    User.create(username: 'Precious', password: 'precious', email: 'precious@yahoo.com')
    visit '/sessions/new'
    fill_in 'email', with: 'precious@yahoo.com'
    fill_in 'password', with: 'precious'
    click_button 'Login'
  end

  describe 'GET /user/1' do
    it 'finds particular user with id' do
      visit user_path(1)
      expect(page).to have_content('Precious')
    end

    it 'creates a new event' do
      visit user_path(1)
      expect(page).to have_content('create an event')
    end

    it 'show up coming events' do
      visit user_path(1)
      expect(page).to have_content('upcoming events')
    end

    it 'shows older events' do
      visit user_path(1)
      expect(page).to have_content('previously attended event')
    end
  end
end
