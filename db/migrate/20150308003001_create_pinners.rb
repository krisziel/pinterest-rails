class CreatePinners < ActiveRecord::Migration
  def change
    create_table :pinners do |t|
    	t.string :username
    	t.string :name
    	t.integer :followers
    	t.integer :following
    	t.integer :pins
      t.timestamps
    end
  end
end
