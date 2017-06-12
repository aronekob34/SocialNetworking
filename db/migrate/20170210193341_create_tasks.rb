class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
	t.string :name
	t.belongs_to :project, index: true
	t.text :description
	t.boolean :completed
	t.string :skill
	t.integer :days
  	t.timestamps
    end
  end
end
