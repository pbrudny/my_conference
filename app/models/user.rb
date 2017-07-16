class User < ApplicationRecord
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :companions, numericality: { greater_than_or_equal_to: 0, less_than: 6 }

  validate :check_available_seats
  belongs_to :donate, optional: true
  belongs_to :category, optional: true

  def self.seats_available?
    User.total_available > 0
  end

  def check_available_seats
    errors.add(:first_name, 'Zabrakło miejsc!') unless User.seats_available?
  end

  def self.total_available
   seats_free > 0 ? seats_free : 0
  end

  def self.seats_free
    700 - eventbrite_users - Donate.donors_not_registered.count - User.count - User.total_companions - locked_seats
  end

  def self.locked_seats
    20
  end

  def self.eventbrite_users
    50
  end

  def self.total_companions
    User.sum(:companions)
  end
end
