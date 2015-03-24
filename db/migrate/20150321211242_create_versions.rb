class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.references :program
      t.datetime :starting_date
      t.datetime :ending_date
      t.references :condition, index: true

      t.timestamps null: false
    end
    add_foreign_key :versions, :conditions
  end
end
