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
	attr_accessible :name, :description, :cooktime, :servingsize, :instruction, :image, :user_id, :cuisine_id
	belongs_to :cuisine
	has_and_belongs_to_many :users
	has_and_belongs_to_many :ingredients
end	
