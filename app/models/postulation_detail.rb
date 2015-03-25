class PostulationDetail < ActiveRecord::Base
	belongs_to :postulation
	has_many :languages
	accepts_nested_attributes_for :languages
end
