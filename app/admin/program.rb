ActiveAdmin.register Program do
  config.comments = false
  menu label: "Programas"
  permit_params :title, :description
  sidebar "Versiones", only: [:show, :edit] do
    ul do
      li link_to "Versiones", admin_program_versions_path(program)
    end
  end

end
