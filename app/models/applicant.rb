class Applicant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:signin] #:confirmable
  attr_accessor :signin
  has_many :postulations
  belongs_to :condition, class_name: "PostulationCondition"
 	validates :name,:presence => true,:uniqueness => {:case_sensitive => false}
  after_create { |admin| admin.send_reset_password_instructions }
   def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if signin = conditions.delete(:signin)
        where(conditions.to_h).where(["lower(name) = :value OR lower(email) = :value", { :value => signin.downcase }]).first
      else
        where(conditions.to_h).first
      end
    end
  
    def password_required?
      new_record? ? false : super
    end

end
