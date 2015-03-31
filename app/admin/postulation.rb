ActiveAdmin.register Postulation do
	menu false
	controller do
		nested_belongs_to :program, :version
	end
	permit_params :name, :email, :condition_id
	

	batch_action :flag, form: {
		type: %w[Offensive Spam Other],
		reason: :text,
		notes:  :textarea,
		hide:   :checkbox,
		date:   :datepicker
		} do |ids, inputs|
  	# inputs is a hash of all the form fields you requested
  	redirect_to request.referer, notice: [ids, inputs].to_s
	end
end
