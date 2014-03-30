# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  cooktime    :integer
#  servingsize :integer
#  instruction :text
#  image       :text
#  user_id     :integer
#  cuisine_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Recipe < ActiveRecord::Base
	attr_accessible :name, :description, :cooktime, :servingsize, :instruction, :image, :user_id, :cuisine_id, :yummly_id, :rating
	belongs_to :cuisine
	has_and_belongs_to_many :users
	has_and_belongs_to_many :ingredients
	
	validates :yummly_id, :uniqueness => true

    def self.yummly(search)
        search = URI.escape(search)
        app_key = "43d68684682bf636cfc259b4c36c275c"
        app_id = "94c36fdb"
        url = "http://api.yummly.com/v1/api/recipes?_app_id=#{app_id}&_app_key=#{app_key}&q=#{search}&maxResult=10&start=10"
        @search_result = HTTParty.get(url)
        if @search_result['matches'] == []
          nil
          #If the search returns no matches, the self.yummly method will return nil;
        else
            @status = "found results" 
            @search_result["matches"].each do |result|
                recipe = Recipe.new
                recipe.yummly_id = result["id"]
                recipe.name = result["recipeName"]
                recipe.image = result["smallImageUrls"].first
                recipe.rating = result["rating"]
                recipe.servingsize = result["numberOfServings"]
                recipe.cooktime = result["totalTimeInSeconds"]
                recipe.save
                result["ingredients"].each do |ingredient_result|
                    ingredient = Ingredient.new  
                    ingredient.name = ingredient_result
                    ingredient.save
                    recipe.ingredients << ingredient 
                end 
            #If the search does return results the method will return an array of recipes with the search name in the name;
            end
            recipes = Recipe.where('name ilike ?', "%#{search}%")
            @recipes = recipes.reverse
        end
    end
end	
