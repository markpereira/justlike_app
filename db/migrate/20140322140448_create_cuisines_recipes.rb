class CreateCuisinesRecipes < ActiveRecord::Migration
  def change
    create_table :cuisines_recipes, :id => false do |t|
    	t.integer :cuisine_id
    	t.integer :recipe_id
    end
  end
end
