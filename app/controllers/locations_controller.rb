class LocationsController < ApplicationController
	def index
		@location= Location.new
		@locations = Location.all		
	end

	def create
		@location = Location.new params[:location].permit!
		if @location.save
			flash[:notice] = "Record created successfully"
			redirect_to locations_path
		else
			@@locations = Location.all
			render "index"
		end
	end

	def edit
		@location = Location.find params[:id]
		render :partial => "form"
	end

	def update
		@location = Location.find(params[:id])		
		if @location.update_attributes(params[:location].permit!)
			flash[:notice] = "Record updated successfully"
			redirect_to locations_path
		else
			@locations = Location.all
			render "index"
		end
	end

	def destroy
		@location = Location.find(params[:id])		
		if @location.destroy
			flash[:notice] = "Record deleted successfully"
			redirect_to locations_path
		else
			@locations = Location.all
			render "index"
		end
	end
end
