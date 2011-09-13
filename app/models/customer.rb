class Customer < ActiveRecord::Base
   validates_presence_of :name, :description
   has_many :products, :through=>:categories
   has_many :categories
   has_attached_file :photo, :styles => { :medium => "140x180>", :full => "300x300>" }
  
end
