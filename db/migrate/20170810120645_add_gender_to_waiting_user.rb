class AddGenderToWaitingUser < ActiveRecord::Migration[5.0]
  def change
    add_column :waiting_users, :gender, :string

  end
end
