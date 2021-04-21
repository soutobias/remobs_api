class Spotter < ActiveRecord::Base
  establish_connection :external_raw
  self.table_name = "spotter_status"
  self.primary_key = 'id_serial'
  belongs_to :buoy
end
