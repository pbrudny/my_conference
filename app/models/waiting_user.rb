class WaitingUser < ApplicationRecord
  belongs_to :category

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  belongs_to :category, optional: true

  has_many :mailing_users, dependent: :destroy
end
