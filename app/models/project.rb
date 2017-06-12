class Project < ApplicationRecord
	has_many :tasks, :dependent => :destroy
	has_many :ads, :dependent => :destroy
	has_and_belongs_to_many :developers, :dependent => :destroy
	has_and_belongs_to_many :hosts, :dependent => :destroy
	accepts_nested_attributes_for :tasks
	accepts_nested_attributes_for :ads

	validates :name, :description, :percentage_completion, :budget, :nemployees, :ninvestors, presence: true	
end
