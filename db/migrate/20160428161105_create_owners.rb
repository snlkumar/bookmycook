class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
    	t.string :first_name
    	t.string :first_name
    	t.integer :mobile
    	t.string :address
    	t.string :state
    	t.string :country, default: "India"
    	t.string :need_for
    	t.integer :adults
    	t.integer :children
    	t.boolean :want_demo, default: false
    	t.string :photo
      t.timestamps null: false
    end
  end
end
