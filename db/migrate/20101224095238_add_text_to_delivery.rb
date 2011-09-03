class AddTextToDelivery < ActiveRecord::Migration
  def self.up
    add_column :deliveries, :text, :text
  end

  def self.down
    remove_column :deliveries, :text
  end
end