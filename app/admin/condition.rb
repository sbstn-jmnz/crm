ActiveAdmin.register Condition do
   permit_params :name, :description, :type
   menu label: "Estados"
   #config.comments = false
index do
    column 'Nombre', :name
    column 'Description', :description
    column 'Tipo', :type
    actions
  end

  filter :name_cont, label: 'Nombre'
  filter :type

end