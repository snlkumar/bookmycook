class DishTypesOwners < ActiveRecord::Migration
  def change
  	create_table :dish_types_owners, id: false do |t|
      t.references :owner
      t.references :dish_type
    end
  end
end
