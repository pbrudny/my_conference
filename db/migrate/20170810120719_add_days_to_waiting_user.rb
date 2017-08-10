class AddDaysToWaitingUser < ActiveRecord::Migration[5.0]
  def change
    add_column :waiting_users, :days, :string, default: 'all'
  end
end
