class User < ApplicationRecord
  validates_email_format_of :email, message: I18n.t('wrong_email')
  validates :email, presence: true
  validates :days, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :companions, numericality: { greater_than_or_equal_to: 0, less_than: 6 }

  belongs_to :donate, optional: true
  belongs_to :category, optional: true

  has_many :mailing_users, dependent: :destroy

  scope :selected, -> { where(selected: true) }

  def self.seats_available?
    false
    # User.total_available > 0
  end

  def check_available_seats
    errors.add(:first_name, 'Zabrakło miejsc!') unless User.seats_available?
  end

  def self.total_available
   seats_free > 0 ? seats_free : 0
  end

  def self.seats_free
    1500 - User.people_count - Donate.donors_not_registered.count
  end

  def self.total_companions
    User.sum(:companions)
  end

  def self.people_count
    User.count + User.total_companions + TeamMember.count
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |result|
        csv << result.attributes.values_at(*column_names)
      end
    end
  end
end
