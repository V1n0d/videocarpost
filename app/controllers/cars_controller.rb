class CarsController < ApplicationController
	before_filter :authenticate_user!, :except => [:index, :dynamic_models]

	# Search using sphinx or get random 5 cars
	def index
		can_search = false
		@noresults = false
		@message = ''

		if params.length > 2
			with = {}
			conditions = {}

			if params[:car_id].present? && params[:car_id]!=''
				@selected_video = Car.find(params[:car_id])
				conditions[:vehicle_make_id] = @selected_video.vehicle_make_id
				can_search = true
				from = "recommended"
			else
				if params[:zip_code] != ""
					conditions[:zip_code] = params[:zip_code]
				end
				if params[:year] != ""
					conditions[:year] = params[:year]
				end
				if params[:vehicle_make_name] != ""
					conditions[:vehicle_make_id] = params[:vehicle_make_name]
				end
				if params[:car_model_name] != ""
					conditions[:car_model_id] = params[:car_model_name]
				end
				if params[:miles_upto] != ""
					conditions[:miles] = 0..params[:miles_upto].to_i
				end
				if params[:price_upto] != ""
					conditions[:price] = 0..params[:price_upto].to_i
				end
				if conditions.count != 0 || with.count != 0
					can_search = true
				end
				from = "search"
			end
		else
			can_search = false
		end

		if can_search
			@results = Car.where(conditions)
			#binding.pry
			if @results.length == 0
				@results = Car.new.random_cars
				if from = "search"
					@noresults = params.length > 2 ? true : false
				end
			end

			if @results.length == 1
				@main_video = @results.first
				@results = Car.new.random_cars
				#@noresults = params.length > 2 ? true : false
			end

				
		else
			@results = Car.new.random_cars
			@noresults = params.length > 2 ? true : false
		end

		if @noresults
			flash.now[:notice] = "No results found for your search query. We have got some recommendations for you."
		end	
		
		if @selected_video.present? || @results.count >0
			if(@selected_video.present?)
				@main_video = @selected_video
			else
				@main_video = @main_video.present? ? @main_video : @results.first
			end
		else
			@message = "No Results Found"
		end
	end

	def new
		if current_user.can_upload >= 1
			@car = Car.new
		else
			#redirect_to root_path, alert: "Please Buy Credits For Uploading New Videos." 
			redirect_to buy_credits_path, alert: "Please Buy Credits For Uploading New Videos." 
			
		end	
	end


	def create
		@car = Car.new(car_params)
		if @car.save
			current_user.update_attributes(:can_upload => current_user.can_upload-1)
			redirect_to root_path
		else
			respond_to do |format|
				format.html { render action: 'new' }
				format.json { render json: @car.errors, status: :unprocessable_entity }
			end
		end
	end

	def dynamic_models
		brand = VehicleMake.find_by(:id => params[:brand_id])
		@carmodels = CarModel.where(:vehicle_make_id=>brand.id).select('distinct id, name')
		@from = params[:from]
		respond_to do |format|
    		format.html { render "cars/dynamic_models", :layout=>false }
  		end
	end

	def car_params
		params.require(:car).permit!
	end
end
