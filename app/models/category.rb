class Category < ActiveRecord::Base
  belongs_to :product
  has_and_belongs_to_many :customers
  validates_presence_of :name 
end
