class ChangeDevelopersInterests < ActiveRecord::Migration[5.0]
  def change
  	rename_column :developers, :interests, :interest_list
  end
end
