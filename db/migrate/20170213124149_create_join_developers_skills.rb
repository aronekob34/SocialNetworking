class CreateJoinDevelopersSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :developers_skills do |t|
    	t.belongs_to :developer, index: true
    	t.belongs_to :skill, index: true
    end
  end
end
