# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/created
  def user_registered
    UserMailer.user_registered(User.first)
  end

  def user_accepted
    UserMailer.user_accepted(User.first)
  end

  def custom
    UserMailer.custom(User.first, Mailing.last)
  end

  def add_companions
    UserMailer.add_companions(User.find_by(companions: 2))
  end
end
