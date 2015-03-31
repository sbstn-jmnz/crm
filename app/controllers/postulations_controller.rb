class PostulationsController < ApplicationController
	before_action :set_postulation, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_applicant!
	
	def new
		@ultima_postulacion_usuario = Postulation.where(applicant_id: current_applicant.id, version_id: 1).last
		##Si el usuario no tiene una postulacion activa para el programa pasa a una nueva postulacion
		if !@ultima_postulacion_usuario.nil?
			redirect_to final_step_postulations_path
		end	
		@postulation = Postulation.new
		@postulation_details = @postulation.build_postulation_detail
	end

	def create
		@postulation = Postulation.new(postulation_params)
		@postulation.applicant_id = current_applicant.id
		#Se agrea por defeto una version del programa y un administrador
		@postulation.version_id = 1
		@postulation.admin_user_id = 1
		@postulation.condition_id = 4

		@postulation.save
		redirect_to :controller => "postulation_details", :action => "new", :id => @postulation.postulation_detail.id 
	end

	def final_step
		@ultima_postulacion_usuario = Postulation.where(applicant_id: current_applicant.id, version_id: 1).last

	end

	def show
	end

    def edit
	end

	 def update
	 	@postulation.update(postulation_params)
	 	redirect_to final_step_postulations_path, notice: "Campos actualizados"	 	
	 end

	private
		def set_postulation
			@postulation = Postulation.find(params[:id])
		end

		def postulation_params
			params.require(:postulation).permit(postulation_detail_attributes: [:id, :motivation])
		end
end
