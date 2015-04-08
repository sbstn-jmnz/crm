class AddNameToAdminVersions < ActiveRecord::Migration
  def up
    add_column :versions, :name, :string
 end
  def down
  	remove_column :versions, :name, :string
  end
end
