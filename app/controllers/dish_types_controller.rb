class DishTypesController < ApplicationController
	before_filter :find_obj, only: [:edit, :update, :destroy]
	def index
		@dish_type= DishType.new
		@dish_types = DishType.all		
	end

	def create
		@dish_type = DishType.new params[:dish_type].permit!
		if @dish_type.save
			flash[:notice] = "Record created successfully"
			redirect_to dish_types_path
		else
			@dish_types = DishType.all
			render "index"
		end
	end

	def edit		
		render :partial => "form"
	end

	def update			
		if @dish_type.update_attributes(params[:dish_type].permit!)
			flash[:notice] = "Record updated successfully"
			redirect_to dish_types_path
		else
			@dish_types = DishType.all
			render "index"
		end
	end

	def destroy				
		if @dish_type.destroy
			flash[:notice] = "Record deleted successfully"
			redirect_to dish_types_path
		else
			@dish_types = DishType.all
			render "index"
		end
	end

	private
	def find_obj
		@dish_type = DishType.find(params[:id])
	end
end
