class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.references :user
      t.string :role
      t.timestamps
    end
  end
end
