ActiveAdmin.register Postulation do
	menu false	
	permit_params :applicant_id, :admin_user_id, :condition_id, :version_id
	config.comments = false

	controller do
		nested_belongs_to :program, :version
	end

	
	member_action :show_web, method: :get do
	   	@postulations = Postulation.all
	end

	

	


    batch_action :mail, form: {
	    	asunto: :text,
	    	texto:  :textarea,	
	    	} do |ids, inputs|
  	# inputs is a hash of all the form fields you requested
  	redirect_to request.referer, notice: [ids, inputs].to_s
  end
end
