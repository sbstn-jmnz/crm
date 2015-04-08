ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :name
  menu label: "Administradores"
  config.comments = false
  
  index do
    selectable_column
    column :name
    column :email
    column :sign_in_count
    column :created_at
    actions
  end

 # show do
 #    h3 "Nombre: "+admin_user.name
 #    div do
 #      simple_format admin_user.email
 #    end
 #    div do
 #      render 'show_partial', { admin_user: admin_user }
 #    end
 #  end

 # sidebar "sidebar de Prueba", only: :show do
 #    attributes_table_for admin_user do
 #      row :name
 #      row :email
 #     #row('Published?') { |b| status_tag b.published? }
 #    end
 #  end


show name: :email do
    attributes_table do
      row "nombre", :name do |admin_user|
        admin_user.name
      end
      row :email do |admin_user|
         admin_user.email
      end
    end
end





  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :email
  end
    f.actions
  end

end
