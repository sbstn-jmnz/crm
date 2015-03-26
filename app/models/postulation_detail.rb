class PostulationDetail < ActiveRecord::Base
	belongs_to :postulation
	has_many :languages
	accepts_nested_attributes_for :languages# :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
