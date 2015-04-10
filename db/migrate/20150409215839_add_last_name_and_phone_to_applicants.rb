class AddLastNameAndPhoneToApplicants < ActiveRecord::Migration
  def up
    add_column :applicants, :last_name, :string
    add_column :applicants, :phone, :string
 end
  def down
  	remove_column :applicants, :last_name, :string
  	remove_column :applicants, :phone, :string
  end
end
