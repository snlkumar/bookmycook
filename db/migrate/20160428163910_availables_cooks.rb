class AvailablesCooks < ActiveRecord::Migration
  def change
    create_table :availables_cooks, id: false do |t|
    	t.references :available
    	t.references :cook      
    end
  end
end
