class AddTokenToDonate < ActiveRecord::Migration[5.0]
  def change
    add_column :donates, :token, :string
    add_index :donates, :token, unique: true
    Donate.all.each { |d| d.regenerate_token }
  end
end
