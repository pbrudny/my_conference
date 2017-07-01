class Donate < ApplicationRecord
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates_email_format_of :email, message: I18n.t('wrong_email')
  validates :email, presence: true

  has_many :users

  has_secure_token
  
  def self.percentage
    return 1 if self.total > self.total_cost
    Float(self.total) / self.total_cost
  end

  def self.total
    Donate.all.sum(:amount)
  end

  def self.total_cost
    ENV['total_cost'].to_i
  end
  
  def above_limit?
    amount > ENV['donate_limit'].to_i
  end

  def self.iban_number
    ENV['iban_number']
  end

  def self.swift_number
    ENV['swift_number']
  end

  def self.account_number
    ENV['account_number']
  end

  def self.bank_name
    ENV['bank_name']
  end

  def self.bank_address
    ENV['bank_address']
  end
end
