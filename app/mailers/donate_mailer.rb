class DonateMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.donate_mailer.created.subject
  #
  def donation_declared(donate)
    @greeting = "Cześć #{donate.first_name}"
    @above if donate.above_limit?

    mail to: donate.email
  end
end
