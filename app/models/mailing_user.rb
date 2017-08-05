class MailingUser < ApplicationRecord
  belongs_to :mailing
  belongs_to :user

  validates :mailing, uniqueness: { scope: :user_id, message: I18n.t('one_mail_per_user') }
end
