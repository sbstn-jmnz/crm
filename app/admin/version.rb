ActiveAdmin.register Version do
  config.comments = false
  belongs_to :program
  permit_params :program_id, :supply, :starting_date, :ending_date, :condition_id

	sidebar "Versiones", only: [:show, :edit] do
    ul do
      li link_to "Postulaciones", admin_program_version_postulations_path(program,version)
    end
  end


end
