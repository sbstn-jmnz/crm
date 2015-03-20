class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :nul before_filter :authenticate_user!l_session instead.
  protect_from_forgery with: :exception
  
  #Esto es para que los usuarios esten siempre logeados
  #before_filter :authenticate_user!
   private
  #Esto es para setear el titulo de cada pagina basado en el nombre del controlador que se
  #esta ejecutando
  before_filter :do_common_stuff
  def do_common_stuff
    @controllerName = self.class.name.sub("Controller", "").singularize
    @acctionName = params["action"].to_s
  end

  #
  #Esto es para redirigir despues de log in y log out
  #
  #Where to go after sign in
   #def after_sign_in_path_for(user)
   # users_dashboard_path
  #end
  
  #Where to go after sign out
  def after_sign_out_path_for(admin_users)
    redirect_to "/"
  end
end
