class AddFieldsToAds < ActiveRecord::Migration[5.0]
  def change
  	change_table :ads do |t|
  		t.belongs_to :location, index: true
  		t.belongs_to :task, index: true
  		t.boolean :remote
  		t.string :skill_list
  	end
  end
end
