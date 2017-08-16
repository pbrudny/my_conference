class User < ApplicationRecord
  validates_email_format_of :email, message: I18n.t('wrong_email')
  validates :email, presence: true
  validates :days, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :companions, numericality: { greater_than_or_equal_to: 0, less_than: 6 }

  validate :check_available_seats, on: :create
  belongs_to :donate, optional: true
  belongs_to :category, optional: true

  has_many :mailing_users, dependent: :destroy

  scope :selected, -> { where(selected: true) }

  def self.seats_available?
    User.total_available > 0
  end

  def check_available_seats
    errors.add(:first_name, I18n.t('no_more_seats')) unless User.seats_available?
  end

  def self.total_available
   seats_free > 0 ? seats_free : 0
  end

  def self.seats_free
    0
  end

  def self.locked_seats
    50
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.people_count_saturday
    TeamMember.count + User.both_days + User.only_saturday
  end

  def self.people_count_sunday
    TeamMember.count + User.both_days + User.only_sunday
  end

  def self.both_days
    User.where(days: 'both_days').count + User.where(days: 'both_days').sum(:companions)
  end

  def self.only_saturday
    User.where(days: 'saturday').count + User.where(days: 'saturday').sum(:companions)
  end

  def self.only_sunday
    User.where(days: 'sunday').count + User.where(days: 'sunday').sum(:companions)
  end

  def self.admin_login
    ENV['login']
  end

  def self.admin_password
    ENV['password']
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
