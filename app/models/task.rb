class Task < ActiveRecord::Base
  belongs_to :postulation
  belongs_to :admin_user
 
  validates :title, :applicant_id, :admin_user_id, :presence => true
  validates :is_done, :inclusion => { :in => [true, false] }
end
