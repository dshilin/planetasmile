class CreateTodays < ActiveRecord::Migration
  def self.up
    create_table :todays do |t| 
      t.string :product_ids

      t.timestamps
    end
  end

  def self.down
    drop_table :todays
  end
end
