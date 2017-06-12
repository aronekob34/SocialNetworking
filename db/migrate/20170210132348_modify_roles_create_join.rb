class ModifyRolesCreateJoin < ActiveRecord::Migration[5.0]
  def up
  	remove_column :roles, :user_id
  	create_table(:roles_users) do |t|
  		t.belongs_to :role, index: true
  		t.belongs_to :user, index: true
  	end
  end
  def down
  	change_table :roles do |t|
  		t.references :user
  	end
  	drop_table :roles_users	
  end
end
