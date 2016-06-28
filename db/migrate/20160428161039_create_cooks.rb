class CreateCooks < ActiveRecord::Migration
  def change
    create_table :cooks do |t|
    	t.string :first_name
    	t.string :first_name
    	t.string :mobile
    	t.string :address
    	t.string :state
    	t.string :country, default: "India"
    	t.string :available_for
    	t.string :photo

      t.timestamps null: false
    end
  end
end
