class AddDateToToday < ActiveRecord::Migration
  def self.up
    add_column :todays, :actual_date, :date
    
  end

  def self.down
    remove_column :todays, :actual_date
  end
end
