class PostulationDetailsController < ApplicationController
	before_action :set_postulation_detail, only: [:show, :edit, :update, :destroy]

	def new
		@postulation_detail = PostulationDetail.find(params[:id])
		@languages = @postulation_detail.languages.build
	end

	def update
		@postulation_detail = PostulationDetail.find(params[:id])
		@postulation_detail.update(postulation_detail_params)
		redirect_to final_step_postulations_path
	end

	def edit
	end
	
	private
		def set_postulation_detail
			@postulation_detail = PostulationDetail.find(params[:id])
		end

		def postulation_detail_params
			params.require(:postulation_detail).permit(languages_attributes: [:id, :name, :written_level, :spoken_level])
		end
end
