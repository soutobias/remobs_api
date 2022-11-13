class DriftBuoy < ActiveRecord::Base
    establish_connection :external_new
    self.table_name = "drift.buoys"
    self.primary_key = 'buoy_id'
end