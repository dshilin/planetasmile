class Product < ActiveRecord::Base
  validates_presence_of :name, :price, :description, :category_id, :customer_id
  has_many :line_items
  belongs_to :category
  has_attached_file :photo, :styles => { :medium => "140x180>", :full => "300x300>" }
  cattr_reader :per_page
  @@per_page = 12
  
  def self.actual
    today = Today.find_by_actual_date(Date.today)
    find(((today.product_ids.gsub(/\d+/)).collect), :order=>'category_id, name')
  end

end
