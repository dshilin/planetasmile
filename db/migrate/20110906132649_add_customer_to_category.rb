class AddCustomerToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :customer_id, :integer
  end

  def self.down
    remove_column :categories, :customer_id
  end
end
