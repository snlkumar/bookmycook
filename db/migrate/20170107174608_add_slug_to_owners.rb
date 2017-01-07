class AddSlugToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :slug, :string
  end
end
