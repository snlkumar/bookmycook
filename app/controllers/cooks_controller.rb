class CooksController < ApplicationController	
	before_action :login_required, only: [:edit, :update, :edit_profile]
	before_action :cook, except: [:new, :create, :dashboard]	
    respond_to :json, :html
    layout "profile", :only => [ :profile, :dashboard, :edit_profile]

    def dashboard

    end    

	def new		
		@cook = Cook.new
		@cook.build_user		
	end

	def create
		@cook = Cook.new params[:cook].permit!
		return render "new" unless @cook.save	
		Typhoeus.get("http://api.msg91.com/api/sendhttp.php?authkey=116833AGwj2DXk3Jc577aa295&mobiles=#{@cook.mobile}&message=#{@cook.user.otp_code}&sender=Bookmy&route=4&country=91")	
		flash[:notice] = "Cook created successfully please verify your number"
		redirect_to edit_cook_path(@cook)		
	end

	def edit		
	end

	def update	
	    params[:cook][:user_attributes].except!(:verification_code)	if params[:cook][:user_attributes]
		if @cook.update_attributes params[:cook].permit!
		 	redirect_to profile_cook_path(@cook)
		else
			render "edit"
		end
	end

	def destroy
		@cook.destroy
		redirect_to cooks_path
	end

	def verify		
		cook = Cook.includes(:user).find(params[:id])
		resp = ""
		if cook.user.authenticate_otp(params[:code], drift: 60)
			render json: {status: 400 }
		else
			render json: { error: "No such user", status: 422 }			
		end		
	end

	def profile

	end

	def edit_profile
		p current_user
		@availables = Available.all
		@locations = Location.all
		@dish_types = DishType.all
	end

	private
	def cook
		@cook = Cook.find params[:id]
	end
end