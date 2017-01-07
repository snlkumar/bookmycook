class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session  
  # include Authenticable
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.cook
      edit_profile_cook_path(id: current_user.cook.id)
    else
      edit_profile_owner_path(current_user.owner)
    end
  end

  def login_required
    redirect_to root_path unless current_user
  end

  protected
	 def configure_permitted_parameters	 	
		  devise_parameter_sanitizer.permit(:sign_in) do |user_params|
		    user_params.permit(:username, :email, :password, :remember_me)
		  end
    end
end
