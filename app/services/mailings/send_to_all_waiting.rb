module Mailings
  class SendToAllWaiting
    def initialize(mailing)
      self.mailing = mailing
    end

    def call
      WaitingUser.order(:id).each do |waiting_user|
        UserMailer.custom(waiting_user, mailing).deliver_now if waiting_user.mailing_users.create(mailing: mailing)
      end
      mailing.update_attribute(:sent_at, Time.now)
    end

    private

    attr_accessor :mailing
  end
end