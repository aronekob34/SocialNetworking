class AddFieldsToDevelopers < ActiveRecord::Migration[5.0]
  def change
  	add_column :developers, :jobtitle, :string
  	add_column :developers, :website_url, :string
  end
end
