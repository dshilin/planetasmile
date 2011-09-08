class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.column :name,               :string
      t.column :description,        :text
      t.column :photo_file_name,    :string
      t.column :photo_content_type, :string
      t.column :photo_file_size,    :integer
      t.column :photo_updated_at,   :datetime

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
