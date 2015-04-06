class Program < ActiveRecord::Base
	has_many :versions, :dependent => :destroy
	validates :title, :presence => true
	validates :description, :presence => true
end
