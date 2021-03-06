ActiveAdmin.register Postulation do
  includes :applicant, :admin_user, :version, :tasks
	menu false	
	permit_params :applicant_id, :admin_user_id, :condition_id, :version_id
	config.comments = false

	controller do
		nested_belongs_to :program, :version
	end

  after_create do |postulation| 
    PostulationDetail.create(postulation_id: postulation.id)
  end
	
	member_action :show_web, method: :get do
	   	@postulations = Postulation.all
	end

	 sidebar "sidebar de Prueba", only: :show do
     attributes_table_for postulation do
       row(:applicant) {|p| p.applicant.name}
      end
   end

	 show do

     h3 "Nombre: "+postulation.applicant.name
     div do
       simple_format postulation.applicant.email
     end
        
      tabs do
        tab 'General' do
          attributes_table do
            row(:applicant_id) { status_tag(postulation.applicant.name) }
            row(:Ejecutivo) { postulation.admin_user.name }
            row(:programa) { postulation.version.program.title }
            row(:version) { postulation.version.name }
            row(:estado) { postulation.condition.name }
          end
        end

        tab 'Tareas' do
          table_for postulation.tasks do
            column('Postulante') { |t| t.postulation.applicant.name }
            column('Nombre') { |t| t.title.titleize }
            column('Received On', :created_at)
            column('Due Date', :notes)
            column('Amount') { |t| status_tag t.is_done? }
          end
        end
        tab "Idiomas" do
        	table_for postulation.postulation_detail.languages do
            column('Nombre') { |l| l.name }
            column('Oral') { |l| l.spoken_level }
            column('Escrito') { |l| l.written_level }
        	end
    	end
      end

      div do
       render 'show_partial', { postulation: postulation }
      end
    end
 index do
    selectable_column
    id_column
    column "Postulante", :nombre_del_postulante do |p|
      link_to p.applicant.name, admin_applicant_path(p.applicant,id) 
    end
    column "Estado", :estado_de_postulacion do |p|
      link_to p.condition.name, admin_condition_path(p.condition) 
    end
    column "Tareas totales", :tareas_completadas do |p|
      link_to p.tasks.all.count, admin_program_version_postulation_tasks_path(p.program.id, p.version.id, p.id) 
    end
    actions
  end


    batch_action :mail, form: {
	    	asunto: :text,
	    	texto:  :textarea,	
	    	} do |ids, inputs|
          mails = Array.new
          ids.each do |id|
            mails << Postulation.find_by(id: id).applicant.email
            mail = Postulation.find_by(id: id).applicant.email
            AdminMailer.batch_mail(mail, inputs[:asunto], inputs[:texto]).deliver_later
          end
      # inputs is a hash of all the form fields you requested
  	redirect_to request.referer, notice: "Correos enviados a " + [mails].to_s
  end
end
