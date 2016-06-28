class LanguagesController < ApplicationController
	before_filter :find_obj, only: [:edit, :upate, :destroy]
	def index
		@language= Language.new
		@languages = Language.all		
	end

	def create
		@language = Language.new params[:language].permit!
		if @language.save
			flash[:notice] = "Record created successfully"
			redirect_to languages_path
		else
			@@languages = Language.all
			render "index"
		end
	end

	def edit		
		render :partial => "form"
	end

	def update			
		if @language.update_attributes(params[:language].permit!)
			flash[:notice] = "Record updated successfully"
			redirect_to languages_path
		else
			@languages = Language.all
			render "index"
		end
	end

	def destroy				
		if @language.destroy
			flash[:notice] = "Record deleted successfully"
			redirect_to languages_path
		else
			@languages = Language.all
			render "index"
		end
	end

	private
	def find_obj
		@language = Language.find(params[:id])
	end
end
