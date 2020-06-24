require 'rails_helper'

RSpec.describe 'Main Menu Actions', type: :feature do
  before :each do
    User.create(username: 'Precious', password: 'precious', email: 'precious@yahoo.com')
    visit '/sessions/new'
    fill_in 'email', with: 'precious@yahoo.com'
    fill_in 'password', with: 'precious'
    click_button 'Login'
    sleep(2)
    click_link 'Log Out'
  end

  describe 'top bar navigations' do
    it 'finds the link \'sign up\' on the top bar' do
      expect(page).to have_link('Sign Up', href: '/users/new')
    end

    it 'finds the link \'Log In\' on the top bar' do
      expect(page).to have_link('Log In', href: '/sessions/new')
    end
  end
end
