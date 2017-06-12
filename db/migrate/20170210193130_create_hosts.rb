class CreateHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :hosts do |t|
	t.integer :nbuilding
	t.text :house_type
	t.integer :rooms
	t.integer :bathrooms
	t.boolean :kitchen
	t.text :activities    	
    t.timestamps
    end
  end
end
