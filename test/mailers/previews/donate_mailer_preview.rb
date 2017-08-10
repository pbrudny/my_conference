# Preview all emails at http://localhost:3000/rails/mailers/donate_mailer
class DonateMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/donate_mailer/created
  def donation_declared
    DonateMailer.donation_declared(Donate.first)
  end

  def donation_received
    DonateMailer.donation_received(Donate.last)
  end

  def registration_reminder
    DonateMailer.registration_reminder(Donate.last)
  end
end
