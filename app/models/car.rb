class Car < ActiveRecord::Base

	has_attached_file :video, :styles => {
		:thumb => { :geometry => "200x200!", :format => 'jpg', :time => 3 }
	}, :processors => [:ffmpeg]

		validates_attachment_content_type :video, :content_type => %w(video/mp4) 


		belongs_to :user
		belongs_to :vehicle_make
		belongs_to :car_model

		validates :user_id, :video, :vehicle_make_id, :car_model_id, presence: true
		validates :miles, :price, :year, :city, :state, :zip_code, :contact_number,:vin , presence: true
		validates :video_duration, :numericality => { 
																:greater_than => 10, 
																:less_than_or_equal_to => 180,
																:message => "Video Duration must be less than 3 minutes" 
															}
								
		def random_cars
			Car.all.order("RAND()").limit(5)
		end

		before_validation do 
			duration = self.video_meta[:length].split(':') 
			hrs = duration[0].to_i*3600 
			min = duration[1].to_i*60 
			sec = duration[2].to_i 
			time = hrs+min+sec
			self.video_duration = time
		end
end
