class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
    	t.references :postulation_detail, index: true
    	t.string :name
    	t.string :written_level
    	t.string :spoken_level
      t.timestamps null: false
    end
    add_foreign_key :languages, :postulation_details
  end
end
