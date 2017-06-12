class AddJobtitleIdToDevelopers < ActiveRecord::Migration[5.0]
  def change
  	change_table :developers do |t|
  		t.belongs_to :jobtitle, index: true
  	end
  end
end
