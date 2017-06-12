class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def change
  	change_table :users do |t|
  		t.belongs_to :roles, index: true
  	end
  end
end
