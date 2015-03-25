class Postulation < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :applicant
  belongs_to :version
  belongs_to :condition, class_name: "PostulationCondition"
  has_many :tasks
  has_many :postulation_details
  accepts_nested_attributes_for :postulation_details
end
