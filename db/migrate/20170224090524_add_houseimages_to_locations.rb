class AddHouseimagesToLocations < ActiveRecord::Migration[5.0]
	def change 
		change_table :locations do |t|
			t.text :houseimages
		end
	end
end

=begin
	
  def change
	add_column :locations, :houseimages , :string, array: true, default: []
  end
	
=end

#add_column :locations, :houseimages, :json
#add_column :disciplines, :days, :integer, array: true, default: [] 