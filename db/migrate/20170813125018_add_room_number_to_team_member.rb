class AddRoomNumberToTeamMember < ActiveRecord::Migration[5.0]
  def change
    add_column :team_members, :room, :integer
  end
end
