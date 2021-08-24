class CreateViewers < ActiveRecord::Migration[5.2]
  def change
    create_table :viewers do |t|
      t.string :title
      t.integer :host
      t.time :start_time
      t.date :date
      t.integer :duration

      t.timestamps
    end
  end
end
