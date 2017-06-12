class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
	t.string :name
	t.belongs_to :developer, index: true
	t.belongs_to :host, index: true
	t.string :description
	t.integer :percentage_completion
	t.integer :budget
	t.integer :nemployees
	t.integer :ninvestors
	t.boolean :hiring
  	t.timestamps
    end
  end
end
