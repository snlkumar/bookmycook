class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    	t.string :name
    	t.integer :pincode
      t.timestamps null: false
    end
  end
end
