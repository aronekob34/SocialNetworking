class AccoutsFields < ActiveRecord::Migration[5.0]
  def change
  	add_column :accounts, :firstname, :string
  	add_column :accounts, :lastname, :string
  	add_column :accounts, :country, :string
  	add_column :accounts, :location, :string
  	add_column :accounts, :role, :text
  end
end
