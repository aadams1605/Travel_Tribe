class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.text :content
      t.references :notifiable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
