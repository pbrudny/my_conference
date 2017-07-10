class User < ApplicationRecord
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  validate :check_available_seats
  belongs_to :donate, optional: true

  def self.seats_available?
    User.total_available > 0
  end

  def check_available_seats
    errors.add(:first_name, 'Zabrakło miejsc!') unless User.seats_available?
  end

  def self.total_available
   700 - eventbrite_users - locked_seats - donors_not_registered.count - User.count
  end

  def self.eventbrite_users
    50
  end

  def self.donors_not_registered
    Donate.select{ |d| d.users.count == 0 }
  end

  def self.locked_seats
    50
  end
end
