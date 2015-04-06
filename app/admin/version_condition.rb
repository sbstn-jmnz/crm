ActiveAdmin.register VersionCondition do
permit_params :name, :description
menu parent: "Conditions"
config.comments = false
end
