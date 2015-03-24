ActiveAdmin.register PostulationCondition do
 permit_params :name, :description
 menu parent: "Conditions"
end
