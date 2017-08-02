class CreateTeamMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :team_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :gender
      t.boolean :accommodation
      t.boolean :pts
      t.boolean :jesus_hotel_staff

      t.timestamps
    end
  end
end
