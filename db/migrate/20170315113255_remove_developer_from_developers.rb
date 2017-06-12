class RemoveDeveloperFromDevelopers < ActiveRecord::Migration[5.0]
  def change
    remove_reference :developers, :developer, foreign_key: true
  end
end
