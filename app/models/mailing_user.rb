class MailingUser < ApplicationRecord
  belongs_to :mailing
  belongs_to :user
end
