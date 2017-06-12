class AddColumnsToDevelopers < ActiveRecord::Migration[5.0]
  def change
  	add_column :developers, :skill_list, :string
  end
end
