class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.references :dish_type
      t.references :cook
      t.integer :charges
      t.timestamps null: false
    end
  end
end
