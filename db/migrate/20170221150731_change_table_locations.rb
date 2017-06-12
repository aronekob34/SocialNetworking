class ChangeTableLocations < ActiveRecord::Migration[5.0]
  def up
    change_column :locations, :singleroom, 'boolean USING CAST(singleroom AS boolean)'
    change_column :locations, :sharedroom, 'boolean USING CAST(sharedroom AS boolean)'
    change_column :locations, :surfspot, 'boolean USING CAST(surfspot AS boolean)'
    change_column :locations, :barbecue, 'boolean USING CAST(barbecue AS boolean)'
    change_column :locations, :villa, 'boolean USING CAST(villa AS boolean)'
    change_column :locations, :swimmingpool, 'boolean USING CAST(swimmingpool AS boolean)'
    change_column :locations, :skiresort, 'boolean USING CAST(skiresort AS boolean)'
=begin    
  	change_column :locations, :singleroom, :boolean
  	change_column :locations, :sharedroom, :boolean
  	change_column :locations, :surfspot, :boolean
  	change_column :locations, :barbecue, :boolean
  	change_column :locations, :villa, :boolean
  	change_column :locations, :swimmingpool, :boolean
  	change_column :locations, :skiresort, :boolean
=end    
  end
  def down
    change_column :locations, :singleroom, 'integer USING CAST(singleroom AS integer)'
    change_column :locations, :sharedroom, 'integer USING CAST(sharedroom AS integer)'
    change_column :locations, :surfspot, 'integer USING CAST(surfspot AS integer)'
    change_column :locations, :barbecue, 'integer USING CAST(barbecue AS integer)'
    change_column :locations, :villa, 'integer USING CAST(villa AS integer)'
    change_column :locations, :swimmingpool, 'integer USING CAST(swimmingpool AS integer)'
    change_column :locations, :skiresort, 'integer USING CAST(skiresort AS integer)'
=begin
  	change_column :locations, :singleroom, :integer
  	change_column :locations, :sharedroom, :integer
  	change_column :locations, :surfspot, :integer
  	change_column :locations, :barbecue, :integer
  	change_column :locations, :villa, :integer
  	change_column :locations, :swimmingpool, :integer
  	change_column :locations, :skiresort, :integer
=end
  end  	
end
