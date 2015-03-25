class PostulationsController < ApplicationController
	before_action :set_postulation, only: [:show, :edit, :update, :destroy]
	layout false
	def new
		@postulation = Postulation.new
		@postulation_details = @postulation.postulation_details.build
	end

	def create
		@postulation = Postulation.new(postulation_params)
		@postulation.save
		redirect_to new_postulation_detail_path
	end

	private
		def set_postulation
			@postulation = Postulation.find(params[:id])
		end

		def postulation_params
			params.require(:postulation).permit(postulation_details_attributes: [:motivation])
		end
end
