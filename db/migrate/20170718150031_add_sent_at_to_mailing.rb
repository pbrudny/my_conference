class AddSentAtToMailing < ActiveRecord::Migration[5.0]
  def change
    add_column :mailings, :sent_at, :datetime
  end
end
