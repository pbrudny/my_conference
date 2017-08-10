class AddDaysToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :days, :string, default: 'both_days'
  end
end
