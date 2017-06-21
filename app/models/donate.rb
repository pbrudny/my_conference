class Donate < ApplicationRecord
  def self.percentage
    Float(Donate.all.sum(:amount)) / self.total_cost
  end

  def self.total_cost
    ENV['total_cost'].to_i
  end
end
