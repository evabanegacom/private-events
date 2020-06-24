class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }

  has_and_belongs_to_many :attended_events, class_name: 'Event', inverse_of: 'attendees', through: :events_users
  has_many :events, inverse_of: 'creator', dependent: :destroy

  def upcoming_events
    attended_events.filter { |e| e.event_date > Time.now }
  end

  def previous_events
    attended_events.filter { |e| e.event_date < Time.now }
  end
end
