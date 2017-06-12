class Developer < ApplicationRecord
	#has_many :projects
	has_and_belongs_to_many :projects, :dependent => :destroy
	#has_and_belongs_to_many :skills
	#acts_as_taggable
	acts_as_taggable_on :skills, :interests

	validates :jobtitle_id, :description, :experience, :skill_list, :interest_list, presence: true
end
