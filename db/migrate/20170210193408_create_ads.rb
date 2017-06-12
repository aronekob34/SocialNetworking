class CreateAds < ActiveRecord::Migration[5.0]
  def change
    create_table :ads do |t|
	t.belongs_to :project, index: true
	t.text :title
	t.text :description
	t.integer :budget
	t.integer :days
  	t.timestamps		
    end
  end
end
