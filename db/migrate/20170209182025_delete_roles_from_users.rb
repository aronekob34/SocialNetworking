class DeleteRolesFromUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :role, :text
  end
end
