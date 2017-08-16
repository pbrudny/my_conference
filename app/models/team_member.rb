class TeamMember < ApplicationRecord
  validates :first_name, presence: true
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
    30 - TeamMember.where(accommodation: true).count
  end

  def self.rooms_left
    self.accommodation_left / 2
  end
end
