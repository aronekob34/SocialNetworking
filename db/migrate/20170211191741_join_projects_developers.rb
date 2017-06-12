class JoinProjectsDevelopers < ActiveRecord::Migration[5.0]
  def change
  	create_table :developers_projects, id: false do |t|
  		t.belongs_to :developer, index: true
  		t.belongs_to :project, index: true
  	end

  	create_table :hosts_projects, id:false do |t|
  		t.belongs_to :host, index: true
  		t.belongs_to :project, index: true
  	end
  end
end
