class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.column :adress,            :string
      t.column :contact_name,      :string
      t.column :contact_phone,     :int
      t.column :comment,           :text
      t.column :user_id,           :int
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
