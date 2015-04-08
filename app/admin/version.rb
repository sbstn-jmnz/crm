ActiveAdmin.register Version do
  config.comments = false
  belongs_to :program
  config.comments = false
  permit_params :name, :program_id, :supply, :starting_date, :ending_date, :condition_id

  sidebar "Versiones", only: [:show, :edit] do
    ul do
      li link_to "Postulaciones", admin_program_version_postulations_path(params[:program_id],params[:id])
    end
  end

  
index do
  	selectable_column
  	column :condition_name do |version|
      version.condition.name
    end
  	column "Nombre", :version do |v|
      #hay que agregar el campo title a la tabla version. esta linea quedaria
      # link_to version.title,...
  		link_to v.name, admin_program_version_path(program,v)
  	end
  	column "Total de Postulaciones", :version do |v|
  		link_to v.postulations.count,  admin_program_version_postulations_path(program,v)
  	end
  	# Nombre del estado sea variable del condition_id
  	column "Contacto web", :version do |v|
  		link_to v.postulations.where(condition_id: 4).count, show_web_admin_program_version_postulations_path(v.program_id,v)
  	end
  	column "Capacidad", :supply
  	actions
  end

end
