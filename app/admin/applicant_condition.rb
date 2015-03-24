ActiveAdmin.register ApplicantCondition do
permit_params :name, :description
menu parent: "Conditions"
end
