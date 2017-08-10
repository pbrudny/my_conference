class AddExtraFieldsToDonate < ActiveRecord::Migration[5.0]
  def change
    add_column :donates, :my_plan, :string, default: 'want_to_register'
  end

end
