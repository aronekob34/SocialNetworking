class DeleteHostDeveloperIdFromProjects < ActiveRecord::Migration[5.0]
  def up
  	remove_column :projects, :developer_id
  	remove_column :projects, :host_id
  end
  def down
  	change_table :projects do |t|
  		t.belongs_to :developer, index: true
  		t.belongs_to :host, index: true
  	end
  end
end