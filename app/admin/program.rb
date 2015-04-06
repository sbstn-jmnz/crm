ActiveAdmin.register Program do
  config.comments = false
  menu label: "Programas"
  permit_params :title, :description
  
  sidebar "Versiones", only: [:show, :edit] do
    ul do
      li link_to "Versiones", admin_program_versions_path(program)
    end
  end

  index do
    selectable_column
  	  column "Nombre", :title
      column "Versiones Totales", :versiones do |v|
      v.versions.count
	  end
      column "Versiones Abiertas", :versiones do |v|
      v.versions.where(condition_id: 2).count  
    end
     column "Versiones En Curso", :versiones do |v|
      v.versions.where(condition_id: 10).count  
    end
     column "Versiones Completadas", :versiones do |v|
      v.versions.where(condition_id: 9).count  
    end
    actions
  end

end
