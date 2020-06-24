class Event < ApplicationRecord
  has_and_belongs_to_many :attendees, class_name: 'User', inverse_of: 'attended_events', through: :events_users
  belongs_to :creator, class_name: 'User', foreign_key: :user_id

  validates :description, presence: true

  validates :event_date, presence: true

  validates :event, presence: true

  def self.upcoming_events
    all.filter { |e| e.event_date > Time.now }
  end

  def self.previous_events
    all.filter { |e| e.event_date < Time.now }
  end

  scope :future_events, ->(date) { where('event_date > ?', date) }
  scope :past_events, ->(date) { where('event_date < ?', date) }
end
