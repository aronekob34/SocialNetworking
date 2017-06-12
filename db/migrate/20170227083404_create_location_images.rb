class CreateLocationImages < ActiveRecord::Migration[5.0]
  def change
    create_table :location_images do |t|
      t.integer :location_id
      t.string :houseimages
      t.timestamps
    end
  end
end
