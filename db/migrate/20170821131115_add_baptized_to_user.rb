class AddBaptizedToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :baptized, :boolean
  end
end
