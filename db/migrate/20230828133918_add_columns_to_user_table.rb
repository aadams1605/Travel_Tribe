class AddColumnsToUserTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :description, :text
    add_column :users, :location, :string
    add_column :users, :gender, :string
    add_column :users, :age, :integer
  end
end
