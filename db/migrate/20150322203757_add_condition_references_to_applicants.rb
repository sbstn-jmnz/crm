class AddConditionReferencesToApplicants < ActiveRecord::Migration
 def up
    add_column :applicants, :condition_id, :integer, index: true
	add_foreign_key :applicants, :conditions
  end
  def down
  	remove_column :applicants, :condition_id
  end
end
