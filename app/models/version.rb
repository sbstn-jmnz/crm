class Version < ActiveRecord::Base
  belongs_to :condition, class_name: "VersionCondition"
  belongs_to :program
end
