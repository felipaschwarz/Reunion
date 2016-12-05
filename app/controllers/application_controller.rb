class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller? #wozu dient das
  before_action :authenticate_user!
  protected
    def configure_permitted_parameters
      	devise_parameter_sanitizer.permit(:sign_up, keys: 
	    		[:username,
	      		:firstname,
	      		:lastname,
	      		:address_1,
	      		:address_2,
	      		:city,
	      		:state,
	      		:country,
	      		:email,
	      		:password])
  		
    end
end
