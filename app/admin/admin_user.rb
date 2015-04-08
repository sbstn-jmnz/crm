ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation
  menu label: "Administradores"
  index do
    selectable_column
    column :email
    
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
  end
    f.actions
  end

end
