class ModifyOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :archive, :int, :default=>0
  end

  def self.down
    remove_column :orders, :archive
  end
end
