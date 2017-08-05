module Mailings
  class SendToAll
    def initialize(mailing)
      self.mailing = mailing
    end

    def call
      User.order(:id).each do |user|
        UserMailer.custom(user, mailing).deliver_now if user.mailing_users.create(mailing: mailing)
      end
      mailing.update_attribute(:sent_at, Time.now)
    end

    private

    attr_accessor :mailing
  end
end