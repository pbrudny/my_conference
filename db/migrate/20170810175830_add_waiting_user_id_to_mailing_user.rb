class AddWaitingUserIdToMailingUser < ActiveRecord::Migration[5.0]
  def change
    add_column :mailing_users, :waiting_user_id, :integer
  end
end
