class Customer < ActiveRecord::Base
   validates_presence_of :name, :description
   has_and_belongs_to_many :categories
   has_many :products
   has_attached_file :photo, :styles => { :medium => "140x180>", :full => "300x300>" }
  
end
