class AvailablesOwners < ActiveRecord::Migration
  def change
    create_table :availables_owners, id: false do |t|
    	t.references :available
    	t.references :owner      
    end
  end
end
