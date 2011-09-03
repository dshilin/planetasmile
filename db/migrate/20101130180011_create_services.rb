class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.column :text,           :text
      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
