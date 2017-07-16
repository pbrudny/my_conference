class CreateWaitingUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :waiting_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :fellowship
      t.string :city
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
