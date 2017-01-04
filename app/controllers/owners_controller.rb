class OwnersController < ApplicationController	
	before_action :login_required, only: [:edit, :update, :edit_profile]
	before_action :owner, except: [:signup, :create, :dashboard]
	# before_action :verify_account, only: [:edit_profile]    
    layout "profile", :only => [ :profile, :dashboard ]
    respond_to :json, :html

    def dashboard
    end    

	def signup		
		@owner = Owner.new
		@owner.build_user		
	end

	def create
		debugger
		@owner = Owner.new params[:owner].permit!
		return render "signup" unless @owner.save		
		sign_in @owner.user, :bypass => true 	
		flash[:notice] = "Owner created successfully please verify your number"
		redirect_to edit_owner_path(@owner)		
	end

	def edit		
	end

	def update	
	    params[:owner][:user_attributes].except!(:verification_code) if params[:owner][:user_attributes]
		if @owner.update_attributes params[:owner].permit!
		 	redirect_to profile_owner_path(@owner)
		else
			render "edit"
		end
	end

	def destroy
		@owner.destroy
		redirect_to owners_path
	end

	def verify		
		owner = Owner.includes(:user).find(params[:id])		
		if owner.user.authenticate_otp(params[:code], drift: 50)
			render json: {status: 400 }
		else
			render json: { error: "No such user", status: 422 }			
		end		
	end

	def profile

	end

	def edit_profile		
		@availables = Available.all
		@locations = Location.all
	end

	private
	def owner
		@owner = Owner.find params[:id]
	end

	def verify_account
		debugger
		redirect_to edit_owner_path(id: current_user.owner.id) unless current_user.is_verified
	end
end