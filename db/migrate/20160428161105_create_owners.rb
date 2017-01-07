class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|    	
    	t.string :name
    	t.string :mobile
    	t.string :address
    	t.string :state
    	t.string :country, default: "India"
    	t.string :need_for
        t.string :location
        t.string :language
    	t.integer :adults
    	t.integer :children
        t.string :reference
    	t.boolean :want_demo, default: false
    	t.string :photo
      t.timestamps null: false
    end
  end
end
