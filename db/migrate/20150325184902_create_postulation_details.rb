class CreatePostulationDetails < ActiveRecord::Migration
  def change
    create_table :postulation_details do |t|
    	t.references :postulation, index: true
    	t.text :motivation
      t.timestamps null: false
    end
    add_foreign_key :postulation_details, :postulations
  end
end
