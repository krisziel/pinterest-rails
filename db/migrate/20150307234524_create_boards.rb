class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
    	t.string :title
    	t.string :images
    	t.string :link
    	t.integer :pins
    	t.text :description
    	t.integer :user_id
      t.timestamps
    end
  end
end
