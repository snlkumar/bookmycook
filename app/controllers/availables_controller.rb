class AvailablesController < ApplicationController
	def index
		@available= Available.new
		@availables = Available.all		
	end

	def create
		@available = Available.new params[:available].permit!
		if @available.save
			flash[:notice] = "Record created successfully"
			redirect_to availables_path
		else
			@availables = Available.all
			render "index"
		end
	end

	def edit
		@available = Available.find params[:id]
		render :partial => "form"
	end

	def update
		@available = Available.find(params[:id])		
		if @available.update_attributes(params[:available].permit!)
			flash[:notice] = "Record updated successfully"
			redirect_to availables_path
		else
			@availables = Available.all
			render "index"
		end
	end

	def destroy
		@available = Available.find(params[:id])		
		if @available.destroy
			flash[:notice] = "Record deleted successfully"
			redirect_to availables_path
		else
			@availables = Available.all
			render "index"
		end
	end
end