# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address_1  :string(255)
#  address_2  :string(255)
#  city       :string(255)
#  postcode   :string(255)
#  country    :string(255)
#  email      :string(255)
#  image      :text
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	attr_accessible :name, :address_1, :address_2, :city, :postcode, :country, :email, :image, :password, :password_confirmation
	has_and_belongs_to_many :recipes

	has_secure_password
  	validates :image, :presence => true
  	validates :name, :presence => true, :uniqueness => true, :length => { :minimum => 2 }
  	validates :email, :presence => true, :uniqueness => true, :length => { :minimum => 2 }
end	
