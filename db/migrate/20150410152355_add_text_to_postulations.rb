class AddTextToPostulations < ActiveRecord::Migration
  def up
    add_column :postulations, :text, :string
    end
  def down
  	remove_column :postulations, :text, :string  	
  end
end
