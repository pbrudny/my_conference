module Mailings
  class SendToSelected
    def initialize(mailing)
      self.mailing = mailing
    end

    def call
      User.selected.each do |user|
        User.transaction do
          user.mailing_users.create!(mailing: mailing)
          UserMailer.custom(user, mailing).deliver_now
        end
      end
      mailing.update_attribute(:sent_at, Time.now)
    end

    private

    attr_accessor :mailing
  end
end