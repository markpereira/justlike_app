class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
    	t.string :name
    	t.string :description
    	t.integer :cooktime
    	t.integer :servingsize
    	t.text :instruction
    	t.text :image
    	t.integer :user_id
    	t.integer :cuisine_id
    	t.timestamps
    end
  end
end
