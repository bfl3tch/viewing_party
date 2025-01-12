class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.integer :duration
      t.date :day
      t.time :start_time

      t.timestamps
    end
  end
end
