class Postulation < ActiveRecord::Base
  belongs_to :admin_user
  belongs_to :applicant
  belongs_to :version
  belongs_to :condition, class_name: "PostulationCondition"
  has_many :tasks
  has_one :postulation_detail, dependent: :destroy
  has_one :program, through: :version
  accepts_nested_attributes_for :postulation_detail
end
