class CreateAvailables < ActiveRecord::Migration
  def change
    create_table :availables do |t|
    	t.string :name
      t.timestamps null: false
    end
  end
end
