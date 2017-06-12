class AddHostIdToAds < ActiveRecord::Migration[5.0]
  def change
  	change_table :ads do |t|
  		t.belongs_to :host, index: true
  	end
  end
end
