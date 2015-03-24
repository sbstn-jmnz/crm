class CreatePostulations < ActiveRecord::Migration
  def change
    create_table :postulations do |t|
      t.references :admin_user, index: true
      t.references :applicant, index: true
      t.references :version, index: true
      t.references :condition, index: true

      t.timestamps null: false
    end
    add_foreign_key :postulations, :admin_users
    add_foreign_key :postulations, :applicants
    add_foreign_key :postulations, :versions
    add_foreign_key :postulations, :conditions
  end
end
