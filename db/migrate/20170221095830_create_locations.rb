class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
     	t.belongs_to :host, index: true
		t.text :description
		t.string :location
		t.integer :singleroom
		t.integer :sharedroom
		t.integer :surfspot
		t.integer :barbecue
		t.integer :villa
		t.integer :swimmingpool
		t.integer :skiresort            
      t.timestamps
    end
  end
end
