class EditTableTasks < ActiveRecord::Migration[5.0]
  def change
  	rename_column :tasks, :skill, :skills_list
  end
end
