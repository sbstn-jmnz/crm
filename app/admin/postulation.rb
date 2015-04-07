ActiveAdmin.register Postulation do
	menu false	
	permit_params :name, :email, :condition_id
	config.comments = false

	controller do
    nested_belongs_to :program, :version
  	end

	# controller do 
	# 	def index
	# 	@postulations = Postulation.all	
	# 	end
	# end

	 # collection_action :index, method: :get do
	 # 	@postulations = Postulation.all
	 # end



	batch_action :flag, form: {
		reason: :text,
		notes:  :textarea,	
		hide:   :checkbox,
		date:   :datepicker
		} do |ids, inputs|
  	# inputs is a hash of all the form fields you requested
  	redirect_to request.referer, notice: [ids, inputs].to_s
  end
end
