class Task < ApplicationRecord
	has_one :ad, :dependent => :destroy
	acts_as_taggable_on :skills
	validates :name, :project_id, :description, :days, presence: true	
end
