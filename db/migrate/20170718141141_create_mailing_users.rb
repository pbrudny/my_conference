class CreateMailingUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :mailing_users do |t|
      t.belongs_to :mailing, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
