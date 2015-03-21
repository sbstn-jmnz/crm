ActiveAdmin.register Condition do
   permit_params :name, :description
index do
    column 'Nombre', :name
    column 'Descripcion', :author
    column 'Tipo', :type
    
    actions
  end

  filter :name_cont, label: 'Nombre'
end