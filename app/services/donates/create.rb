module Donates
  class Create
    def initialize(donate_params)
      self.donate_params = donate_params
    end

    def call
      if donate.save
        DonateMailer.donation_declared(donate).deliver_now
      end
    end

    def donate
      @donate ||= Donate.new(donate_params)
    end

    private

    attr_accessor :donate_params
  end
end