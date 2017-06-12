class LocationImage < ApplicationRecord
	mount_uploader :houseimages, HouseimagesUploader
	belongs_to :location
end
