class TeamMember < ApplicationRecord
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :gender, presence: true
  validate :check_available_accommodation

  def self.accommodation_available?
    self.accommodation_left > 0
  end

  def check_available_accommodation
    if accommodation
      errors.add(:accommodation, 'No accommodation left') unless TeamMember.accommodation_available?
    end
  end

  def self.accommodation_left
    28 - TeamMember.where(accommodation: true).count
  end

  def self.rooms_left
    self.accommodation_left / 2
  end
end
