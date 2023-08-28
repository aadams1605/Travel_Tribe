class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.date :start_date
      t.date :end_date
      t.references :user, null: false, foreign_key: true
      t.integer :capacity

      t.timestamps
    end
  end
end
