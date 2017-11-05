class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :location
      t.string :url_1
      t.string :url_2
      t.string :course
      t.string :summary
      t.string :summary_url

      t.timestamps
    end
  end
end
