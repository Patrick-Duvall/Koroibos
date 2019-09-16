class CreateOlympicEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :olympic_events do |t|
      t.references :olympian, foreign_key: true
      t.string :medal
      t.string :games
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
