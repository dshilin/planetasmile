class Category < ActiveRecord::Base
  belongs_to :customer
  has_many :products
  validates_presence_of :name 
end
