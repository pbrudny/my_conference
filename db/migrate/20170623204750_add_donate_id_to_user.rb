class AddDonateIdToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :donate_id, :integer
  end
end
