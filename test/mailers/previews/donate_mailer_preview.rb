# Preview all emails at http://localhost:3000/rails/mailers/donate_mailer
class DonateMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/donate_mailer/created
  def created
    DonateMailer.created(Donate.first)
  end

end
