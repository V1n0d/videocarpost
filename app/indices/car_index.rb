ThinkingSphinx::Index.define :car, :with => :active_record do
	
	indexes :zip_code
	indexes :year
	indexes vehicle_make(:name), :as => :vehicle_make_name
	indexes car_model(:name), :as => :car_model_name

	# filter attributes
	has miles,price

	# delta index property, to automatic rotation of index
	set_property :delta => :datetime, :threshold => 5.minutes
end