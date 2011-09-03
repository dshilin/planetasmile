class Today < ActiveRecord::Base
    validates_uniqueness_of   :actual_date
    validates_presence_of :product_ids
end
