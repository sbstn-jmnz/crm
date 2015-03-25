class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tasks
  has_many :postulations
#Esto es para crear administradores solo con el mail. Despues el aministrador creado debe ingresar su password  
  after_create { |admin| admin.send_reset_password_instructions }


#Esto permite la creacion de usuarion sin password. Sirve para que el callback after_create
#pueda enviar el correo de confirmacion
def password_required?
  new_record? ? false : super
end
end
