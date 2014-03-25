class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
    	t.string :name
    	t.string :description
    	t.string :measurement
    	t.string :cost
    	t.text :image
    	t.timestamps
    end
  end
end
