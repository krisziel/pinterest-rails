class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
    	t.text :description
    	t.string :domain
    	t.string :link
    	t.string :title
    	t.json :pinners
    	t.integer :repins
    	t.integer :comment_count
    	t.json :comments
    	t.json :images
    	t.json :pin_join
    	t.integer :pinner_id
    	t.integer :board_id
      t.timestamps
    end
  end
end
