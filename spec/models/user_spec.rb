require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures username presence' do
      user = User.new(username: 'spetsnaz', email: 'temple@yahoo.com', password: 'precious5').save
      expect(user).to eql(true)
    end

    it 'ensures email presence' do
      user = User.new(username: 'spetsnaz', email: 'temple@yahoo.com', password: 'precious5').save
      expect(user).to eql(true)
    end

    it 'ensures password presence' do
      user = User.new(username: 'spetsnaz', email: 'temple@yahoo.com').save
      expect(user).to eql(false)
    end
    it 'should save successsfully' do
      user = User.new(username: 'spetsnaz', email: 'temple@yahoo.com', password: 'precious5').save
      expect(user).to eql(true)
    end
  end
end
