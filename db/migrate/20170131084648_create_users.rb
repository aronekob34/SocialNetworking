class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.text :firstname
    	t.text :lastname
    	t.text :country
    	t.text :location
    	t.text :role
    	t.text :email 
    	t.string :password_digest
    	t.timestamps
    end
  end
end
