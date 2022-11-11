class MooredBuoy < ActiveRecord::Base
    establish_connection :external_new
    self.table_name = "moored.buoys"
    self.primary_key = 'buoy_id'
end