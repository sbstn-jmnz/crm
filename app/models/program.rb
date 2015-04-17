class Program < ActiveRecord::Base
	has_many :versions, :dependent => :destroy
	has_many :postulations, through: :versions
	validates :title, :presence => true
	validates :description, :presence => true
end
