class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :address_1
    	t.string :address_2
    	t.string :city
    	t.string :postcode
    	t.string :country
    	t.string :email
    	t.text :image
    	t.timestamps
    end
  end
end
