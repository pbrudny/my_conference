# Preview all emails at http://localhost:3000/rails/mailers/donate_mailer
class DonateMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/donate_mailer/created
  def donation_declared
    DonateMailer.donation_declared(Donate.first)
  end

end
