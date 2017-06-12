class Host < ApplicationRecord
	has_and_belongs_to_many :projects, :dependent => :destroy
	has_many :locations, :dependent => :destroy
	has_many :ads, through: :locations
	has_many :skills, through: :ads

	acts_as_taggable_on :interests #:skills 

	validates :description, :interest_list, presence: true
end
