class Applicants::SessionsController < Devise::SessionsController
 before_filter :configure_sign_in_params, only: [:create]
 #protect_from_forgery :except => :destroy 
 layout false
  # GET /resource/sign_in
   #def new
     #super
   #end

  # POST /resource/sign_in
   #def create
     #super
   #end

  # DELETE /resource/sign_out
   #def destroy
     #super
   #end

  # protected

  # You can put the params you want to permit in the empty array.
   def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:signin, :name, :email, :password, :remember_me) }
    #devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
   end
end
