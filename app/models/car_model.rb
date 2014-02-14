class CarModel < ActiveRecord::Base

	has_many :cars
	belongs_to :vehicle_make

	validates :name, :vehicle_make_id, presence: true
end
