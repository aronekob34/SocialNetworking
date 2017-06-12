class AddDescriptionToDevelopers < ActiveRecord::Migration[5.0]
  def change
    add_column :developers, :description, :string
  end
end
