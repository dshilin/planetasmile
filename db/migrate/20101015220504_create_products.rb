class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.column :name,              :string
      t.column :description,       :text
      t.column :price,             :decimal

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
