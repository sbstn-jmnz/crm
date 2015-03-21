ActiveAdmin.register Task do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :applicant_id, :admin_user_id, :title, :due_date, :is_done
  #
  scope :all, :default => true
  scope :due_this_week do |tasks|
    tasks.where('due_date > ? and due_date < ?', Time.now, 1.week.from_now)
  end
  scope :late do |tasks|
    tasks.where('due_date < ?', Time.now)
  end
  scope :mine do |tasks|
    tasks.where(:admin_user_id => current_admin_user.id)
  end

  show do
    panel "Task Details" do
      attributes_table_for task do
        row("Status") { status_tag (task.is_done ? "Lista" : "Pendiente"), (task.is_done ? :ok : :error) }
        row("Title") { task.title }
        row("Applicant") { link_to task.applicant.name, admin_applicant_path(task.applicant) }
        row("Assigned To") { link_to task.admin_user.email, admin_admin_user_path(task.admin_user) }
        row("Due Date") { task.due_date? ? l(task.due_date, :format => :long) : '-' } 
      end
    end

    active_admin_comments
  end

  sidebar "Otras tareas del Ejecutivo", :only => :show do
    table_for task.admin_user.tasks do |t|
      t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
      t.column("Title") { |task| link_to task.title, admin_task_path(task) }
    end
  end  

  sidebar "Otras tareas del Postulante", :only => :show do
    table_for task.applicant.tasks do |t|
      t.column("Status") { |task| status_tag (task.is_done ? "Done" : "Pending"), (task.is_done ? :ok : :error) }
      t.column("Title") { |task| link_to task.title, admin_task_path(task) }
    end
  end


 index do
 selectable_column
  column :title do |title|
    link_to title.title, admin_task_path(title)
     end
  column :admin_user    
  column :is_done
  column :created_at
  actions
  end
end