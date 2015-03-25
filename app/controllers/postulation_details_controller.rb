class PostulationDetailsController < ApplicationController
	before_action :set_postulation_detail, only: [:show, :edit, :update, :destroy]
	layout false
	def new
		@postulation_detail = PostulationDetail.new
		@languages = @postulation_detail.languages.build
	end

	private
		def set_postulation_detail
			@postulation_detail = PostulationDetail.find(params[:id])
		end

		def postulation_detail_params
			params.require(:postulation_detail).permit(languages_attributes: [:name, :written_level, :spoken_level])
		end
end
