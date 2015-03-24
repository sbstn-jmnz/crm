class Condition < ActiveRecord::Base
	validates :name, :presence => true
	validates :description, :presence => true
	validates :type, :presence => true
end
