class RecreateHostsTable < ActiveRecord::Migration[5.0]
  def up
  	drop_table :hosts
  	create_table :hosts do |t|
  		t.belongs_to :user, index: true
  		t.text :description
  		t.string :location
  		t.integer :singleroom
  		t.integer :sharedroom
  		t.integer :surfspot
  		t.integer :barbecue
  		t.integer :villa
  		t.integer :swimmingpool
  		t.integer :skiresort
  	end
  end
  def down
  	drop_table :hosts
  	create_table :hosts do |t|
    	t.integer :nbuilding
    	t.text :house_type
    	t.integer :rooms
    	t.integer :bathrooms
    	t.boolean :kitchen
    	t.text :activities
    	t.belongs_to :user, index: true    	
      t.timestamps
    end
  end
end
