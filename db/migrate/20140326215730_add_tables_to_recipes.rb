class AddTablesToRecipes < ActiveRecord::Migration
  def change
 	add_column :recipes, :yummly_id, :string
  end
end
