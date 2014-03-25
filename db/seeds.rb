User.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
Cuisine.destroy_all

u1 = User.create(:name => 'Mark', :address_1 => '123 Number Street', :address_2 =>'Chatswood', :city => 'Sydney', :postcode => '2067', :country => 'Australia', :email => 'mark@1234.com', :image => 'http://www.pageresource.com/wallpapers/wallpaper/funny-cartoon-daffy-duck_105326.jpg', :password => 'password', :password_confirmation => 'password')
u2 = User.create(:name => 'Bob', :address_1 => '345 Funny Street', :address_2 =>'Crows Nest', :city => 'Sydney', :postcode => '2098', :country => 'Australia', :email => 'bob@bobby.com', :image => 'http://www.cnjtc.com/wp-content/uploads/2014/01/funny_cartoon_funny_cartoon7.jpg', :password => 'password', :password_confirmation => 'password')
u3 = User.create(:name => 'Mary', :address_1 => '77 Hunter Avenue', :address_2 =>'Rose Bay', :city => 'Sydney', :postcode => '2022', :country => 'Australia', :email => 'mary@gmale.com', :image => 'http://www.pageresource.com/wallpapers/wallpaper/shark-funny-cartoon-awesome_100776.jpg', :password => 'password', :password_confirmation => 'password')

r1 = Recipe.create(:name => 'Smoked Salmon', :description => 'Dinner', :cooktime => 90, :servingsize => 2, :instruction => 'Smoke some salmon!', :image => 'http://img4-3.myrecipes.timeinc.net/i/recipes/ck/04/06/smoked-salmon-ck-642269-l.jpg', :user_id => '1', :cuisine_id => '6')
r2 = Recipe.create(:name => 'Salmon Omelettes', :description => 'Breakfast', :cooktime => 15, :servingsize => 2, :instruction => 'Put some eggs on a salmon!', :image => 'http://4.bp.blogspot.com/_OeYjtwwIWv8/S_ewgNaKNgI/AAAAAAAAETY/Cw0bvFi_hLo/s1600/IMG_0566.jpg', :user_id => '2', :cuisine_id => '6')
r3 = Recipe.create(:name => 'Salmon Sandwich', :description => 'Lunch', :cooktime => 10, :servingsize => 2, :instruction => 'Squish fish between bread!', :image => 'http://myrecipes.ucoz.com/_pu/1/65741974.jpg', :user_id => '3', :cuisine_id => '6')

i1 = Ingredient.create(:name => 'Salmon', :description => 'Salmon is a fish', :measurement => 'pound', :cost => 60.0, :image => 'http://scienceblogs.com/zooillogix/wp-content/blogs.dir/253/files/2012/04/i-c264005ab06a3828a4effadd364bcc90-giant%20chinook%20salmon%20battlecreek.jpg')
i2 = Ingredient.create(:name => 'Eggs', :description => 'Egg is an Egg', :measurement => 'egg', :cost => 4.49, :image => 'http://whatscookingamerica.net/Eggs/EggBasket3.JPG')
i3 = Ingredient.create(:name => 'Tortillas', :description => 'Tortilla is mexican', :measurement => 'tortillas', :cost => 2.29, :image => 'http://www.capital-cooking.com/blog/wp-content/uploads/2012/07/flourTortillas1.gif')
i4 = Ingredient.create(:name => 'Wheat Bread', :description => 'Wheat bread is bread', :measurement => 'loaf', :cost => 3.99, :image => 'http://www.examiner.com/images/blog/EXID24730/images/bread_machine_bread(1).jpg')
i5 = Ingredient.create(:name => 'Lemon', :description => 'Lemon is yellow', :measurement => 'lemon', :cost => 0.90, :image => 'http://meadowdevor.squarespace.com/storage/money%20lemons.jpg?__SQUARESPACE_CACHEVERSION=1334154925539')
i6 = Ingredient.create(:name => 'Butter', :description => 'Butter is kept in the fridge', :measurement => 'ounce', :cost => 2.50, :image => 'http://upload.wikimedia.org/wikipedia/commons/4/45/NCI_butter.jpg')

c1 = Cuisine.create(:name => 'Chinese', :description => 'Chinese food comes from asia')
c2 = Cuisine.create(:name => 'Italian', :description => 'Italian food comes from italy')
c3 = Cuisine.create(:name => 'Singaporean', :description => 'Singaporean food comes from Singapore')
c4 = Cuisine.create(:name => 'Thai', :description => 'Thai food comes from Thailand')
c5 = Cuisine.create(:name => 'Malaysian', :description => 'Malaysian food comes from Malaysia')
c6 = Cuisine.create(:name => 'European', :description => 'European foord comes from all over the world')

