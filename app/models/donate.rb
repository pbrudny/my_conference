class Donate < ApplicationRecord
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :email, presence: true

  def self.percentage
    Float(Donate.all.sum(:amount)) / self.total_cost
  end

  def self.total_cost
    ENV['total_cost'].to_i
  end
  
  def above_limit?
    amount > ENV['donate_limit'].to_i
  end
end
