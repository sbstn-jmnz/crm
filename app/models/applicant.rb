class Applicant < ActiveRecord::Base
  #Relaciones
  has_many :postulations, dependent: :destroy
  has_many :tasks, through: :postulations
  belongs_to :condition, class_name: "PostulationCondition"
  #validaciones
  validates :name, :email, :last_name, presence: true
  validates :email, uniqueness: true
      
end
