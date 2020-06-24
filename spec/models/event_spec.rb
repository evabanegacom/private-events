require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validation tests' do
    it 'ensures description presence' do
      user = User.create(username: 'spetsnaz', email: 'temple@yahoo.com', password: 'precious5')
      event = Event.new(event: 'birthday', event_date: '2020-12-12', user_id: user.id).save
      expect(event).to eql(false)
      # expect(event.class.name).to eql('Event')
    end

    it 'ensures date presence' do
      event = Event.new(event: 'birthday', description: 'birthday-celebration').save
      expect(event).to eql(false)
    end

    it 'ensures event has a title' do
      event = Event.new(description: 'birthday-celebration', event_date: '2020-12-12').save
      expect(event).to eql(false)
    end

    it 'ensures user presence' do
      event = Event.new(event: 'birthday', description: 'birthday-celebration', event_date: '2020-12-12').save
      expect(event).to eql(false)
    end
  end
end
