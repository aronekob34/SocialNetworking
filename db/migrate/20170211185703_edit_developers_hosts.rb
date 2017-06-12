class EditDevelopersHosts < ActiveRecord::Migration[5.0]
  def change
  	change_table(:developers) do |t|
  		t.belongs_to :user, index: true
  	end 

  	change_table(:hosts) do |t|
  		t.belongs_to :user, index: true
  	end
  end
end
