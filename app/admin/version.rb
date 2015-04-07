ActiveAdmin.register Version do
  config.comments = false
  belongs_to :program
  config.comments = false
  permit_params :program_id, :supply, :starting_date, :ending_date, :condition_id

  	sidebar "Versiones", only: [:show, :edit] do
    ul do
      li link_to "Postulaciones", admin_program_version_postulations_path(params[:program_id],params[:id])
    end
  end

  	#admin/postulations/show_web
	member_action :show_web, method: :get do
		  @postulations = Postulation.where(version_id: params[:id], condition_id: 4)
	end

    #admin/postulation/show_total
  member_action :show_total, method: :get do
    @postulations = Postulation.all
  end

index do
  	selectable_column
  	column :condition_name do |version|
      version.condition.name
    end
  	column "Nombre", :version do |version|
      #hay que agregar el campo title a la tabla version. esta linea quedaria
      # link_to version.title,...
  		link_to version.program.title, admin_program_version_path(program,version)
  	end
  	column "Total de Postulaciones", :version do |v|
  		link_to v.postulations.count,  admin_program_version_postulations_path(program,v)
  	end
  	# Nombre del estado sea variable del condition_id
  	column "Contacto web", :version do |v2|
  		link_to v2.postulations.where(condition_id: 4).count, show_web_admin_program_version_path(v2.program_id,v2)
  	end
  	column "Capacidad", :supply
  	actions
  end

end
