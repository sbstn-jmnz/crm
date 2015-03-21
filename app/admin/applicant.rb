ActiveAdmin.register Applicant do

  permit_params :name, :email

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
  end

show :title => :name do
  panel "Tasks" do
    table_for applicant.tasks do |t|
      t.column("Status") { |task| status_tag (task.is_done ? "Lista" : "Pendiente"), (task.is_done ? :ok : :error) }
      t.column("Title") { |task| link_to task.title, admin_task_path(task) }
      t.column("Assigned To") { |task| task.admin_user.email }
      t.column("Due Date") { |task| task.due_date? ? l(task.due_date, :format => :long) : '-' }
    end
  end
end



filter :email
filter :name
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
