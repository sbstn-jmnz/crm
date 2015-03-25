class Program < ActiveRecord::Base
	validates :title, :presence => true
	validates :description, :presence => true
	has_many :versions
end
