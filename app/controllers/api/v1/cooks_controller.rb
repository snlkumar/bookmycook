class Api::V1::CooksController < ApplicationController
	before_action :authenticate_with_token!, except: [:new, :create]
    respond_to :json, :html
	def new		
		@cook = Cook.new
		@cook.build_user		
	end
end