class Location < ApplicationRecord
	has_many :ads, :dependent => :destroy
	has_many :location_images, :dependent => :destroy
	accepts_nested_attributes_for :location_images
	accepts_nested_attributes_for :ads

	validates :country, :state, :location, :description, presence: true

	def country_name
		country = self.country
		ISO3166::Country[country]
	end	

end
