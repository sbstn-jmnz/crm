class AddRoleToAdminusers < ActiveRecord::Migration
  def up
    add_column :admin_users, :role, :string, default: "user"

  end
  def down
  	remove_column :admin_users, :role
  end
end
