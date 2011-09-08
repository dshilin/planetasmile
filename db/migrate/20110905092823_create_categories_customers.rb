class CreateCategoriesCustomers < ActiveRecord::Migration
  def self.up
    create_table :categories_customers, :id=>false do |t|
      t.column :category_id,  :integer, :null=>false
      t.column :customer_id,  :integer, :null=>false
    end
      
  end

  def self.down
    drop_table :categories_customers
  end
end
