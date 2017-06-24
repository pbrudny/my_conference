module Donates
  class SetReceived
    def initialize(donate)
      self.donate = donate
    end

    def call
      if donate.update(received: true)
        DonateMailer.donation_received(donate).deliver_now
      end
    end

    private

    attr_accessor :donate
  end
end