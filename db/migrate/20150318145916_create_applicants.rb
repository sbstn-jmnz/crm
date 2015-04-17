class CreateApplicants < ActiveRecord::Migration
  def change
    create_table(:applicants) do |t|
      ## Database authenticatable
      t.string :name
      t.string :email,              null: false, default: ""
      t.timestamps
    end
  end
end

