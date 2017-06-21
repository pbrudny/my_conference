class CreateDonates < ActiveRecord::Migration[5.0]
  def change
    create_table :donates do |t|
      t.integer :amount
      t.string :email
      t.string :first_name
      t.string :last_name
      t.boolean :received

      t.timestamps
    end
  end
end
