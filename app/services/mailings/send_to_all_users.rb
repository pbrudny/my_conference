module Mailings
  class SendToAllUsers
    def initialize(mailing)
      self.mailing = mailing
    end

    def call
      User.pluck(:email).uniq.each do |e|
        user = User.find_by(email: e)
        UserMailer.custom(user, mailing).deliver_now
        sleep 1
      end
      mailing.update_attribute(:sent_at, Time.now)
    end

    private

    attr_accessor :mailing
  end
end