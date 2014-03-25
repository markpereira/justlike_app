# == Schema Information
#
# Table name: cuisines
#
#  id          :integer          not null, primary key
#  type        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Cuisine < ActiveRecord::Base
	attr_accessible :name, :description
	has_many :recipes
end	
