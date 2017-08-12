class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.created.subject
  #
  def user_registered(user)
    @greeting = "Cześć #{user.first_name}"
    mail to: user.email, subject: 'Potwierdzenie rejestracji'
  end

  def custom(user, mailing)
    @greeting = "Cześć #{user.first_name}"
    @title = mailing.title
    @body = mailing.body

    mail to: user.email, subject: mailing.title
  end

  def user_accepted(user)
    @greeting = "Cześć #{user.first_name}"
    mail to: user.email, subject: 'Zwolniło się miejsce!'
  end

  def add_companions(user)
    @greeting = "Cześć #{user.first_name}"
    @companions = user.companions > 0
    if @companions
      @companions_number = user.companions
    end
    mail to: user.email, subject: 'Prosimy podać pozostałe osoby'
  end
end
