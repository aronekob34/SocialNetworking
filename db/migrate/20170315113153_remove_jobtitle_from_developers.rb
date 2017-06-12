class RemoveJobtitleFromDevelopers < ActiveRecord::Migration[5.0]
  def change
    remove_column :developers, :jobtitle, :string
  end
end
