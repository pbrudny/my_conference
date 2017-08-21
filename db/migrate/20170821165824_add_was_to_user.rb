class AddWasToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :was, :boolean
    User.selected.each do |u|
      u.update_attributes(was: true)
    end
  end
end
