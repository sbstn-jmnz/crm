ActiveAdmin.register Program do
  config.comments = false
  menu label: "Programas"
  permit_params :title, :description


  sidebar "Versiones", only: [:show, :edit] do
    ul do
      li link_to "Versiones", admin_program_versions_path(program)
    end
  end

  #admin/programs/show_open_versions
  member_action :show_open_versions, method: :get do
      @open_versions = Version.where(program_id: params[:id], condition_id: 2)
  end

  index do
    selectable_column
  	  column "Nombre", :title do |program|
        link_to program.title, admin_program_path(program) 
      end
      column "Versiones Totales", :versiones_totales_del_programa do |program|
      link_to program.versions.count, admin_program_versions_path(program) 
	  end
      column "Versiones Abiertas", :versiones_abiertas_del_programa do |program|
      link_to program.versions.where(condition_id: 2).count, show_open_versions_admin_program_path(program)  
    end
     column "Versiones En Curso", :versiones_en_curso_del_programa do |program|
      program.versions.where(condition_id: 10).count  
    end
     column "Versiones Completadas", :versiones_completadas_del_programa do |program|
      program.versions.where(condition_id: 9).count  
    end
  end

end
