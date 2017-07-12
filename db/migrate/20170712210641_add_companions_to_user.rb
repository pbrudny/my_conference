class AddCompanionsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :companions, :integer, default: 0
  end
end
