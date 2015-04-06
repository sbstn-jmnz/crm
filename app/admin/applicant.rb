ActiveAdmin.register Applicant do
menu label: "Postulantes"
config.comments = false
  permit_params :name, :email, :condition

  index do
   selectable_column
   column :name do |nombre|
   link_to nombre.name, admin_applicant_path(nombre)
        end
    column :email
    column :condition
    column :sign_in_count
    column :created_at
    actions
    #:input_html => {:rows => 5, :cols => 50, :class => "tinymce"}
  end

filter :email
filter :name
filter :sign_in_count
filter :created_at

form do |f|
  f.inputs "Admin Details" do
    f.input :name
    f.input :email
    f.input :condition
  end
  f.actions
end

end
