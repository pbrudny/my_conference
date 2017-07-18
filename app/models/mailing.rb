class Mailing < ApplicationRecord
  has_many :mailing_users

  validates :title, presence: true
  validates :body, presence: true
end
