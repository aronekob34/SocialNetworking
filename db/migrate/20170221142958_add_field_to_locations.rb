class AddFieldToLocations < ActiveRecord::Migration[5.0]
  def change
  	add_column :locations, :country, :string
  	add_column :locations, :state, :string
  end
end
