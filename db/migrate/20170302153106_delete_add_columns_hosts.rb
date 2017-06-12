class DeleteAddColumnsHosts < ActiveRecord::Migration[5.0]
  def change
  	remove_column :hosts, :location, :string
  	remove_column :hosts, :singleroom, :integer
  	remove_column :hosts, :sharedroom, :integer
  	remove_column :hosts, :surfspot, :integer
  	remove_column :hosts, :barbecue, :integer
  	remove_column :hosts, :villa, :integer
  	remove_column :hosts, :swimmingpool, :integer
  	remove_column :hosts, :skiresort, :integer

  	add_column :hosts, :interest_list, :string
  	add_column :hosts, :skill_list, :string
  end
end