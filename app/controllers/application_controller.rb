class ApplicationController < ActionController::Base

   def after_sign_in_path_for(resource)
     if resource == :admin
        admin_session_path
     end 
   end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
   if resource == :admin
      admin_session_path
   elsif resource == :public
      root_path
   end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end


end
