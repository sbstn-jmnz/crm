class Postulation < ActiveRecord::Base
  has_one :admin_user
  has_one :applicant
  has_one :version
  has_one :condition, class_name: "PostulationCondition"
  has_many :tasks
  has_one :postulation_detail
  accepts_nested_attributes_for :postulation_detail
end
