class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :nul before_filter :authenticate_user!l_session instead.
  protect_from_forgery with: :exception
  
  
  #Esto es para setear el titulo de cada pagina basado en el nombre del controlador que se
  #esta ejecutando
  before_filter :do_common_stuff
  def do_common_stuff
    @controllerName = self.class.name.sub("Controller", "").singularize
    @acctionName = params["action"].to_s
  end
  
  #Donde lo manda si entra a un lugar no authorizado
  #def access_denied(exception)
   #redirect_to "/", alert: exception.message
  #end
  
  private  
  #Where to go after sign out
  def after_sign_out_path_for(admin_users)
  '/'
  end
end
