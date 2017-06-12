class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :firstname, :string
  	add_column :users, :lastname, :string
  	add_column :users, :country, :string
  	add_column :users, :location, :string
  	add_column :users, :role, :text
  end
end
