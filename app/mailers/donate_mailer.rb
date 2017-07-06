class DonateMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.donate_mailer.created.subject
  #
  def donation_declared(donate)
    @greeting = "Cześć #{donate.first_name}"
    @above if donate.above_limit?
    @amount = donate.amount
    @account = Donate.account_number
    mail to: donate.email, subject: 'Wpłata na kickstart'
  end

  def donation_received(donate)
    @name = donate.first_name
    @token = donate.token
    mail to: donate.email, subject: 'Otrzymaliśmy wpłatę'
  end

  def registration_reminder(donate)
    @greeting = "Hej #{donate.first_name}"
    @token = donate.token
    mail to: donate.email, subject: 'Przypomnienie o rejestracji'
  end
end
