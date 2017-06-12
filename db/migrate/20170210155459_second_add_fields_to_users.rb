class SecondAddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :image, :string
  	add_column :users, :verified, :boolean
  	add_column :users, :location_id, :integer
  	add_column :users, :gender, :text
  	add_column :users, :timezone, :integer
  	add_column :users, :description, :text
  end
end
