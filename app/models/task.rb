class Task < ActiveRecord::Base
  belongs_to :postulation
  has_one :admin_user, through: :postulation 
  has_one :applicant, through: :postulation
 
  validates :title, :presence => true
  validates :is_done, :inclusion => { :in => [true, false] }
  accepts_nested_attributes_for :postulation
end
