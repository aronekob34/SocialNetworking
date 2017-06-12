class Ad < ApplicationRecord
	acts_as_taggable_on :skills
	validates :project_id, :title, :description, :days, :location_id, :task_id, presence: true	
end
