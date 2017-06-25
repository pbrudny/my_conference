class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.created.subject
  #
  def user_registered(user)
    @greeting = "Hej #{user.first_name}"

    mail to: user.email, subject: 'Potwierdzenie rejestracji'
  end
end
