class CooksLocations < ActiveRecord::Migration
  def change
    create_table :cooks_locations, id: false do |t|
    	t.references :location
    	t.references :cook      
    end
  end
end
