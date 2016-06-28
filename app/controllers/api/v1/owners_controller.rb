class Api::V1::OwnersController < ApplicationController
	before_action :authenticate_with_token!, except: [:new, :create]
    respond_to :json
	def new		
		owner = Owner.new
		owner.build_user
		respond_with owner
	end
end