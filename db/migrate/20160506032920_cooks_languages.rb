class CooksLanguages < ActiveRecord::Migration
  def change
    create_table :cooks_languages, id: false do |t|
    	t.references :language
    	t.references :cook      
    end
  end
end
